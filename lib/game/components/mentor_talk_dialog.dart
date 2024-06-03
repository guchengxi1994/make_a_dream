import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/notifiers/mentor_npc_notifier.dart';
import 'package:markdown_widget/markdown_widget.dart';

class MentorTalkDialog extends ConsumerStatefulWidget {
  const MentorTalkDialog({super.key});

  @override
  ConsumerState<MentorTalkDialog> createState() => _MentorTalkDialogState();
}

class _MentorTalkDialogState extends ConsumerState<MentorTalkDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((v) {
      ref.read(mentorProvider.notifier).introduce();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mentorProvider);
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                        controller:
                            ref.read(mentorProvider.notifier).controller,
                        child: MarkdownBlock(
                          data: state.$1,
                          selectable: false,
                          config: MarkdownConfig.defaultConfig,
                        ),
                      )),
                      if (state.$2)
                        SizedBox(
                          height: 40,
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              TextButton(
                                  onPressed: () {
                                    ref.read(mentorProvider.notifier).reset();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Got it"))
                            ],
                          ),
                        )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
