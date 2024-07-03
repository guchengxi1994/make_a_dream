import 'package:audioplayers/audioplayers.dart';

class AudioUtils {
  AudioUtils._();

  static final _instance = AudioUtils._();

  factory AudioUtils() => _instance;

  static const String _prefix = 'audio';

  static const String mainBgm = '$_prefix/main_audio.mp3';

  static AudioPlayer player = AudioPlayer();

  Future setloop() async {
    await player.setReleaseMode(ReleaseMode.loop);
  }

  Future playMainBgm() async {
    await player.play(AssetSource(mainBgm), mode: PlayerMode.lowLatency);
  }

  double get volume => player.volume;

  Future setVolume(double value) async {
    await player.setVolume(value);
  }
}
