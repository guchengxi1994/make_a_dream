import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/notifiers/fountain_notifier.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:make_a_dream/i18n/strings.g.dart';
import 'package:make_a_dream/style/app_style.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'avatar_widget.dart';
import 'fountain_option_button.dart';

class FountainDialog extends ConsumerStatefulWidget {
  const FountainDialog({super.key});

  @override
  ConsumerState<FountainDialog> createState() => _FountainDialogState();
}

class _FountainDialogState extends ConsumerState<FountainDialog> {
  final AiClient aiClient = AiClient();
  final TextEditingController controller = TextEditingController();

  bool isAnswering = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(fountainProvider);
    if (!isAnswering) {
      return Material(
        color: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              const SizedBox.expand(),
              Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width - 20,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        border: Border.all(width: 3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: NpcAvatarWidget(
                            avatar: aiClient.getAvatarByName(state.npc.name),
                            name: state.npc.name,
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(Translations.of(context).fountain.wish,
                                      style: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  ...state.options
                                      .map((v) => FountainOptionButton(
                                            option: v,
                                            onTap: (s) {
                                              setState(() {
                                                isAnswering = true;
                                              });

                                              ref
                                                  .read(
                                                      fountainProvider.notifier)
                                                  .plot(s);
                                            },
                                          )),
                                  SizedBox(
                                    height: 50,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: TextField(
                                          controller: controller,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(fontSize: 20),
                                          decoration:
                                              AppStyle.inputDecorationWithHint(
                                                  "Input your wish",
                                                  fontSize: 20),
                                        )),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        TextButton(
                                            autofocus: true,
                                            onPressed: () {
                                              if (controller.text == "") {
                                                return;
                                              }

                                              setState(() {
                                                isAnswering = true;
                                              });

                                              ref
                                                  .read(
                                                      fountainProvider.notifier)
                                                  .plot(controller.text);
                                            },
                                            child: const Text("Send"))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  TextButton(
                                      autofocus: true,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Leave"))
                                ],
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            const SizedBox.expand(),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 20,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: NpcAvatarWidget(
                          avatar: aiClient.getAvatarByName(state.npc.name),
                          name: state.npc.name,
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: SingleChildScrollView(
                            controller:
                                ref.read(fountainProvider.notifier).controller,
                            child: MarkdownBlock(
                              data: state.dialog,
                              selectable: false,
                              config: MarkdownConfig.defaultConfig,
                            ),
                          )),
                          if (state.conversationDone && state.dialog != "")
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  TextButton(
                                      autofocus: true,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Got it"))
                                ],
                              ),
                            )
                        ],
                      ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
