import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:make_a_dream/opening_page/components/quiz_builder.dart';
import 'package:make_a_dream/opening_page/components/role_selection.dart';
import 'package:make_a_dream/opening_page/notifiers/create_player_notifier.dart';
import 'package:make_a_dream/style/app_style.dart';

class CreatePlayerDialog extends ConsumerWidget {
  CreatePlayerDialog({super.key});
  final AiClient client = AiClient();

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(createPlayerProvider);
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(15),
      color: Colors.transparent,
      child: SizedBox(
        width: 300,
        height: 300,
        child: PageView(
          controller: ref.read(createPlayerProvider.notifier).controller,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              child: Column(
                children: [
                  const Text("输入你的姓名"),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: controller,
                    textAlign: TextAlign.center,
                    decoration:
                        AppStyle.inputDecorationWithHint("Input your name"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("选择你的角色"),
                  const RoleSelection(),
                  const Expanded(child: SizedBox()),
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      TextButton(
                          onPressed: () {
                            // Navigator.of(context).pop(controller.text);
                            ref
                                .read(createPlayerProvider.notifier)
                                .setName(controller.text);
                            ref
                                .read(createPlayerProvider.notifier)
                                .animateTo(1);
                          },
                          child: const Text("Next"))
                    ],
                  )
                ],
              ),
            ),
            ...QuizBuilder(model: client.roleQuizModel).build()
          ],
        ),
      ),
    );
  }
}
