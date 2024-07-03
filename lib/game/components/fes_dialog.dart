import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/notifiers/fes_notifier.dart';
import 'package:make_a_dream/global/ai_client.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'avatar_widget.dart';

class FesDialog extends ConsumerStatefulWidget {
  const FesDialog({super.key});

  @override
  ConsumerState<FesDialog> createState() => _FesDialogState();
}

class _FesDialogState extends ConsumerState<FesDialog> {
  final AiClient aiClient = AiClient();
  final TextEditingController controller = TextEditingController();

  bool isAnswering = false;

  @override
  void initState() {
    super.initState();
    ref.read(fesProvider.notifier).plot();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(fesProvider);

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
                                ref.read(fesProvider.notifier).controller,
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
