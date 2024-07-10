import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/common/toast_utils.dart';
import 'package:make_a_dream/game/notifiers/simple_chat_notifier.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'avatar_widget.dart';

class SimpleChatDialog extends ConsumerStatefulWidget {
  const SimpleChatDialog(
      {super.key, required this.name, required this.prompt, this.avatar});
  final String name;
  final String prompt;
  final String? avatar;

  @override
  ConsumerState<SimpleChatDialog> createState() => _SimpleChatDialogState();
}

class _SimpleChatDialogState extends ConsumerState<SimpleChatDialog> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    ref
        .read(simpleChatProvider(widget.name).notifier)
        .plot(humanMessage: widget.prompt);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(simpleChatProvider(widget.name));
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
                  height: isExpanded
                      ? MediaQuery.of(context).size.height * 0.8
                      : 200,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: NpcAvatarWidget(
                          avatar: widget.avatar ?? "",
                          name: widget.name,
                        ),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: SingleChildScrollView(
                            controller: ref
                                .read(simpleChatProvider(widget.name).notifier)
                                .controller,
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
                                        setState(() {
                                          isExpanded = !isExpanded;
                                        });
                                      },
                                      child: isExpanded
                                          ? const Icon(Icons.expand_more)
                                          : const Icon(Icons.expand_less)),
                                  TextButton(
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                                text: state.dialog))
                                            .then((_) {
                                          ToastUtils.decorationToast(context,
                                              toast: "copied");
                                        });
                                      },
                                      child: const Text("Copy")),
                                  TextButton(
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
