import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AICharacterDisplay extends StatefulWidget {
  const AICharacterDisplay({
    super.key,
    required this.imagePath,
    this.isNetworkImage = false,
    this.riveAssetPath,
    this.isTalking = false,
    this.visemeId = 0,
    this.visemeDurationMs = 200,
    this.onMediaReady,
  });

  final String imagePath;
  final bool isNetworkImage;
  final String? riveAssetPath;
  final bool isTalking;
  final double visemeId;
  final double visemeDurationMs;
  final VoidCallback? onMediaReady;

  @override
  State<AICharacterDisplay> createState() => _AICharacterDisplayState();
}

class _AICharacterDisplayState extends State<AICharacterDisplay> {
  FileLoader? _fileLoader;
  bool _didNotifyReady = false;
  RiveWidgetController? _controller;
  ViewModelInstance? _viewModel;

  @override
  void initState() {
    super.initState();
    _initializeRiveLoader();
  }

  void _initializeRiveLoader() {
    if (widget.riveAssetPath == null) return;

    final path = widget.riveAssetPath!;
    _fileLoader?.dispose();
    try {
      _fileLoader = path.startsWith('http')
          ? FileLoader.fromUrl(path, riveFactory: Factory.flutter)
          : FileLoader.fromAsset(path, riveFactory: Factory.flutter);
    } catch (e) {
      debugPrint('Error initializing Rive FileLoader: $e');
    }
  }

  void _notifyReady() {
    if (_didNotifyReady) return;
    _didNotifyReady = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) widget.onMediaReady?.call();
    });
  }

  @override
  void didUpdateWidget(covariant AICharacterDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.riveAssetPath != widget.riveAssetPath) {
      _didNotifyReady = false;
      _initializeRiveLoader();
    }
    if (oldWidget.isTalking != widget.isTalking ||
        oldWidget.visemeId != widget.visemeId ||
        oldWidget.visemeDurationMs != widget.visemeDurationMs) {
      _applySpeechState();
    }
  }

  @override
  void dispose() {
    _fileLoader?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Render Rive animation if path is provided
    final fileLoader = _fileLoader;
    if (widget.riveAssetPath != null && fileLoader != null) {
      return RiveWidgetBuilder(
        fileLoader: fileLoader,
        onLoaded: _onRiveLoaded,
        builder: (context, state) {
          if (state is RiveLoading) {
            _notifyReady(); // Notify even during loading
            return const Center(child: CircularProgressIndicator());
          } else if (state is RiveFailed) {
            // Fall through to image fallback on failure
            debugPrint('Rive loading failed: ${state.error}');
            _notifyReady();
            return _buildImageFallback();
          } else if (state is RiveLoaded) {
            _notifyReady();
            return SizedBox.expand(
              child: RiveWidget(
                controller: state.controller,
                fit: Fit.cover,
                alignment: Alignment.center,
              ),
            );
          }
          _notifyReady();
          return _buildImageFallback();
        },
      );
    }

    // No Rive path provided, render image directly
    _notifyReady();
    return _buildImageFallback();
  }

  Widget _buildImageFallback() {
    return SizedBox.expand(
      child: widget.isNetworkImage
          ? Image.network(
              widget.imagePath,
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, _) => child,
              errorBuilder: (context, error, stackTrace) => _errorPlaceholder(),
            )
          : Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
              frameBuilder: (context, child, frame, _) => child,
              errorBuilder: (context, error, stackTrace) => _errorPlaceholder(),
            ),
    );
  }

  Widget _errorPlaceholder() {
    return Container(
      color: Colors.grey.shade900,
      child: const Center(
        child: Icon(Icons.person, size: 80, color: Colors.white24),
      ),
    );
  }

  void _onRiveLoaded(RiveLoaded loaded) {
    _controller = loaded.controller;
    try {
      _viewModel = _controller?.dataBind(DataBind.auto());
    } catch (_) {
      _viewModel = null;
    }
    _applySpeechState();
  }

  void _applySpeechState() {
    _updateRiveProperty('talk', widget.isTalking);
    _updateRiveProperty('visemeNum', widget.visemeId);
    _updateRiveProperty('duration', widget.visemeDurationMs);
  }

  void _updateRiveProperty(String name, dynamic value) {
    final vm = _viewModel;
    if (vm == null) return;

    try {
      if (value is bool) {
        vm.boolean(name)?.value = value;
        return;
      }
      if (value is num) {
        vm.number(name)?.value = value.toDouble();
        return;
      }
    } catch (_) {
      // Fall back to generic property iteration for older Rive runtimes.
    }

    try {
      for (final prop in vm.properties) {
        if (prop.name == name) {
          (prop as dynamic).value = value;
          return;
        }
      }
    } catch (_) {}
  }
}
