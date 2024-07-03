import 'package:bonfire/bonfire.dart';

class RoomBg extends GameDecoration {
  RoomBg({required super.position, required super.size})
      : super.withSprite(
          sprite: Sprite.load('Room1.png'),
        );
}
