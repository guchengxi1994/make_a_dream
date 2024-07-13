import 'package:bonfire/bonfire.dart';

class RoomBg extends GameDecoration {
  RoomBg(
      {required super.position, required super.size, this.path = 'Room1.png'})
      : super.withSprite(
          sprite: Sprite.load(path),
        );
  final String path;
}
