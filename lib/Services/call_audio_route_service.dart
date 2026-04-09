import 'package:audioplayers/audioplayers.dart';
import 'package:chatface/Services/tts_playback_service.dart';

/// Voice call audio routing between earpiece and speaker.
class CallAudioRouteService {
  CallAudioRouteService(this._ttsPlaybackService);

  final TtsPlaybackService _ttsPlaybackService;

  static final AudioContext _defaultAudioContext = AudioContext(
    android: AudioContextAndroid(),
    iOS: AudioContextIOS(),
  );

  static final AudioContext _voiceEarpieceContext = AudioContext(
    android: AudioContextAndroid(
      isSpeakerphoneOn: false,
      audioMode: AndroidAudioMode.inCommunication,
      contentType: AndroidContentType.speech,
      usageType: AndroidUsageType.voiceCommunication,
      audioFocus: AndroidAudioFocus.gain,
    ),
    iOS: AudioContextIOS(
      category: AVAudioSessionCategory.playAndRecord,
      options: {
        AVAudioSessionOptions.allowBluetooth,
        AVAudioSessionOptions.allowBluetoothA2DP,
        AVAudioSessionOptions.allowAirPlay,
      },
    ),
  );

  static final AudioContext _voiceSpeakerContext = AudioContext(
    android: AudioContextAndroid(
      isSpeakerphoneOn: true,
      audioMode: AndroidAudioMode.inCommunication,
      contentType: AndroidContentType.speech,
      usageType: AndroidUsageType.voiceCommunication,
      audioFocus: AndroidAudioFocus.gain,
    ),
    iOS: AudioContextIOS(
      category: AVAudioSessionCategory.playAndRecord,
      options: {
        AVAudioSessionOptions.allowBluetooth,
        AVAudioSessionOptions.allowBluetoothA2DP,
        AVAudioSessionOptions.allowAirPlay,
        AVAudioSessionOptions.defaultToSpeaker,
      },
    ),
  );

  Future<void> configureVoiceCall({bool speakerOn = false}) {
    return _applyContext(
      speakerOn ? _voiceSpeakerContext : _voiceEarpieceContext,
    );
  }

  Future<void> setSpeakerOn(bool enabled) {
    return configureVoiceCall(speakerOn: enabled);
  }

  Future<void> reset() {
    return _applyContext(_defaultAudioContext);
  }

  Future<void> _applyContext(AudioContext context) async {
    await AudioPlayer.global.setAudioContext(context);
    await _ttsPlaybackService.setAudioContext(context);
  }
}
