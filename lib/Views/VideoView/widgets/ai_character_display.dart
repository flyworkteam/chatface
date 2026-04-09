import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'rive_scene_cache.dart';

typedef RiveStateWidgetBuilder =
    Widget Function(BuildContext context, RiveState state);
typedef RiveWidgetFactory =
    Widget Function(
      BuildContext context,
      RiveSceneHandle riveSceneHandle,
      ValueChanged<RiveLoaded> onLoaded,
      RiveStateWidgetBuilder stateBuilder,
    );

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
    this.riveSceneHandle,
    this.riveWidgetFactory,
  });

  final String imagePath;
  final bool isNetworkImage;
  final String? riveAssetPath;
  final bool isTalking;
  final double visemeId;
  final double visemeDurationMs;
  final VoidCallback? onMediaReady;
  final RiveSceneHandle? riveSceneHandle;
  final RiveWidgetFactory? riveWidgetFactory;

  @override
  State<AICharacterDisplay> createState() => _AICharacterDisplayState();
}

class _AICharacterDisplayState extends State<AICharacterDisplay> {
  RiveSceneHandle? _riveSceneHandle;
  bool _didNotifyReady = false;
  RiveWidgetController? _controller;
  ViewModelInstance? _viewModel;

  @override
  void initState() {
    super.initState();
    _resolveRiveSceneHandle();
  }

  void _resolveRiveSceneHandle() {
    _riveSceneHandle =
        widget.riveSceneHandle ??
        RiveSceneCache.shared.handleFor(widget.riveAssetPath);
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
    if (oldWidget.riveAssetPath != widget.riveAssetPath ||
        oldWidget.riveSceneHandle != widget.riveSceneHandle) {
      _didNotifyReady = false;
      _resolveRiveSceneHandle();
    }
    if (oldWidget.isTalking != widget.isTalking ||
        oldWidget.visemeId != widget.visemeId ||
        oldWidget.visemeDurationMs != widget.visemeDurationMs) {
      _applySpeechState();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final riveSceneHandle = _riveSceneHandle;
    if (widget.riveAssetPath != null && riveSceneHandle != null) {
      return _buildRiveWidget(context, riveSceneHandle);
    }

    _notifyReady();
    return _buildImageFallback();
  }

  Widget _buildRiveWidget(
    BuildContext context,
    RiveSceneHandle riveSceneHandle,
  ) {
    final builderFactory = widget.riveWidgetFactory;
    if (builderFactory != null) {
      return builderFactory(
        context,
        riveSceneHandle,
        _onRiveLoaded,
        (context, state) => _buildForRiveState(context, state),
      );
    }

    return RiveWidgetBuilder(
      fileLoader: riveSceneHandle.fileLoader,
      onLoaded: _onRiveLoaded,
      builder: (context, state) => _buildForRiveState(context, state),
    );
  }

  Widget _buildForRiveState(BuildContext context, RiveState state) {
    if (state is RiveLoading) {
      return _buildImageFallback();
    } else if (state is RiveFailed) {
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
