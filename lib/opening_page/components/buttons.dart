import 'package:bonfire/parallax/camera_parallax.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/common/logger_utils.dart';
import 'package:make_a_dream/opening_page/notifiers/buttons_notifier.dart';

class OpeningScreenButtons extends ConsumerStatefulWidget {
  const OpeningScreenButtons({super.key});

  @override
  ConsumerState<OpeningScreenButtons> createState() =>
      _OpeningScreenButtonsState();
}

class _OpeningScreenButtonsState extends ConsumerState<OpeningScreenButtons> {
  final FocusNode _focusNode1 = FocusNode(debugLabel: "1");
  final FocusNode _focusNode2 = FocusNode(debugLabel: "2");
  final FocusNode _focusNode3 = FocusNode(debugLabel: "3");
  final FocusNode _focusNode4 = FocusNode(debugLabel: "4");

  late final nodeList = [_focusNode1, _focusNode2, _focusNode3, _focusNode4];

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(color: Colors.lightBlue.withOpacity(0.1)),
          // padding: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          child: FocusTraversalGroup(
              policy: WidgetOrderTraversalPolicy(
                requestFocusCallback: (node,
                    {alignment, alignmentPolicy, curve, duration}) {
                  // print(node.debugLabel);
                  logger.info("[flutter] switch to ${node.debugLabel}");
                  ref
                      .read(buttonProvider.notifier)
                      .changeStateWithDebugLabel(node.debugLabel!);
                },
              ),
              child: FittedBox(
                child: Column(
                    children: ButtonsNotifier.defaultModels
                        .mapIndexed(
                            (i, v) => _Button(node: nodeList[i], model: v))
                        .toList()),
              )),
        ),
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button({required this.node, required this.model});
  final ButtonModel model;
  final FocusNode node;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(buttonProvider);
    bool focused = model.debugLabel == state.current?.debugLabel;

    return Focus(
        focusNode: node,
        autofocus: focused,
        child: MouseRegion(
          onEnter: (event) {
            ref
                .read(buttonProvider.notifier)
                .changeStateWithDebugLabel(model.debugLabel);
          },
          onExit: (event) {
            ref.read(buttonProvider.notifier).changeState(null);
          },
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              if (model.onTap != null) {
                model.onTap!(context, ref);
              }
            },
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: focused
                      ? Colors.lightBlue.withOpacity(0.5)
                      : Colors.transparent),
              child: Center(
                child: Text(
                  model.content,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
          ),
        ));
  }
}
