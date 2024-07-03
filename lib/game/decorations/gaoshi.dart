import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/gaoshi_dialog.dart';
import 'package:make_a_dream/game/decorations/decoration_mixin.dart';

class Gaoshi extends GameDecoration with Sensor<Player>, DecorationMixin {
  Gaoshi({required super.position, required super.size, required this.ref});

  bool isTouched = false;
  final WidgetRef ref;

  @override
  void onContact(Player component) {
    if (!isTouched) {
      isTouched = true;
      gameRef.player!.stopMove();

      showGeneralDialog(
          barrierLabel: "fes",
          barrierDismissible: true,
          context: context,
          barrierColor: Colors.transparent,
          pageBuilder: (c, _, __) {
            return const Center(
              child: GaoshiDialog(
                npcName: "gaoshi",
                prompt: """
帮我设计一个中文字谜。
要求: 
1.谜面是四句诗词。
2.给出和谜面相关的一个问题，并提供四个选项，选项中只有一个是正确答案。
3.结果以json形式返回，json格式如下：{"quiz": "谜面","question": "问题", "options": ["选项1", "选项2", "选项3", "选项4"], "answer": "正确选项","reason":"解释"}。
4.仅返回json,不需要返回其它内容。
""",
              ),
            );
          }).then((v) {
        if (v == true) {
          gameRef.player!.stopMove();
          // [11 * 16  = 176,58 * 928]
          gameRef.player!
              .translate(Vector2(-(position.x - 176), -(position.y - 928)));
        }
      });
    }
    updatePosition(ref, Vector2(position.x, position.y + 20));

    super.onContact(component);
  }

  @override
  void onContactExit(Player component) {
    isTouched = false;
    super.onContactExit(component);
  }
}
