import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/widgets.dart';
import 'package:proximity_sensor/proximity_sensor.dart';

/// Manages phone-call style proximity behavior for voice calls.
class CallProximityGuardService extends ChangeNotifier
    with WidgetsBindingObserver {
  CallProximityGuardService({bool observeLifecycle = true})
    : _observeLifecycle = observeLifecycle,
      _isForeground = _resolveInitialForeground(observeLifecycle) {
    if (_observeLifecycle) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  final bool _observeLifecycle;

  StreamSubscription<int>? _proximitySubscription;
  bool _voiceCallActive = false;
  bool _speakerOn = false;
  bool _isForeground;
  bool _isNear = false;
  bool _isMonitoring = false;
  bool _isSupported = false;
  bool _supportChecked = false;
  bool _nativeScreenOffEnabled = false;

  bool get isVoiceCallActive => _voiceCallActive;
  bool get isSpeakerOn => _speakerOn;
  bool get isForeground => _isForeground;
  bool get isNear => _isNear;
  bool get isMonitoring => _isMonitoring;
  bool get isSupported => _isSupported;
  bool get nativeScreenOffEnabled => _nativeScreenOffEnabled;

  bool get shouldShowOverlay =>
      _isMonitoring &&
      _isNear &&
      (!Platform.isAndroid || !_nativeScreenOffEnabled);

  static bool _resolveInitialForeground(bool observeLifecycle) {
    if (!observeLifecycle) {
      return true;
    }

    final lifecycleState = WidgetsBinding.instance.lifecycleState;
    return lifecycleState == null ||
        lifecycleState == AppLifecycleState.resumed;
  }

  Future<void> setVoiceCallState({
    required bool active,
    required bool speakerOn,
  }) async {
    final hasChanged = _voiceCallActive != active || _speakerOn != speakerOn;
    _voiceCallActive = active;
    _speakerOn = speakerOn;
    await _syncMonitoring();
    if (hasChanged) {
      notifyListeners();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final isForeground = state == AppLifecycleState.resumed;
    if (_isForeground == isForeground) {
      return;
    }

    _isForeground = isForeground;
    unawaited(_syncMonitoring());
    notifyListeners();
  }

  @override
  void dispose() {
    if (_observeLifecycle) {
      WidgetsBinding.instance.removeObserver(this);
    }
    unawaited(_proximitySubscription?.cancel());
    if (_nativeScreenOffEnabled && Platform.isAndroid) {
      unawaited(ProximitySensor.setProximityScreenOff(false));
    }
    super.dispose();
  }

  Future<void> _syncMonitoring() async {
    if (!_voiceCallActive || _speakerOn || !_isForeground) {
      await _stopMonitoring();
      return;
    }

    await _ensureSupportChecked();
    if (!_isSupported) {
      await _stopMonitoring();
      return;
    }

    await _startMonitoring();
  }

  Future<void> _ensureSupportChecked() async {
    if (_supportChecked) {
      return;
    }

    _supportChecked = true;
    try {
      _isSupported = await ProximitySensor.isProximitySensorAvailable();
    } catch (_) {
      _isSupported = false;
    }
  }

  Future<void> _startMonitoring() async {
    if (_isMonitoring) {
      return;
    }

    if (Platform.isAndroid) {
      try {
        await ProximitySensor.setProximityScreenOff(true);
        _nativeScreenOffEnabled = true;
      } catch (_) {
        _nativeScreenOffEnabled = false;
      }
    } else {
      _nativeScreenOffEnabled = false;
    }

    _proximitySubscription = ProximitySensor.events.listen(
      (event) {
        final nextIsNear = event > 0;
        if (_isNear == nextIsNear) {
          return;
        }
        _isNear = nextIsNear;
        notifyListeners();
      },
      onError: (_) {
        if (_isNear) {
          _isNear = false;
          notifyListeners();
        }
      },
    );
    _isMonitoring = true;
    notifyListeners();
  }

  Future<void> _stopMonitoring() async {
    await _proximitySubscription?.cancel();
    _proximitySubscription = null;

    if (_nativeScreenOffEnabled && Platform.isAndroid) {
      try {
        await ProximitySensor.setProximityScreenOff(false);
      } catch (_) {}
    }

    final wasMonitoring = _isMonitoring;
    final wasNear = _isNear;
    final hadNativeScreenOff = _nativeScreenOffEnabled;

    _isMonitoring = false;
    _isNear = false;
    _nativeScreenOffEnabled = false;

    if (wasMonitoring || wasNear || hadNativeScreenOff) {
      notifyListeners();
    }
  }
}
