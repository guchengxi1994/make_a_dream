import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
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
          child: Focus(
              focusNode: _focusNode,
              autofocus: true,
              onKeyEvent: (node, event) {
                // print(event);
                if (event is KeyDownEvent) {
                  return KeyEventResult.ignored;
                }

                if (event.logicalKey == LogicalKeyboardKey.enter) {
                  if (ref.read(buttonProvider).current?.onTap != null) {
                    logger.info(
                        "[flutter] current button id ${ref.read(buttonProvider).current?.debugLabel}");
                    ref.read(buttonProvider).current?.onTap!(context, ref);
                    return KeyEventResult.handled;
                  }
                } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
                  ref.read(buttonProvider.notifier).next();
                  logger.info(
                      "[flutter] next button id ${ref.read(buttonProvider).current?.debugLabel}");

                  return KeyEventResult.handled;
                } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
                  ref.read(buttonProvider.notifier).previous();
                  logger.info(
                      "[flutter] previous button id ${ref.read(buttonProvider).current?.debugLabel}");

                  return KeyEventResult.handled;
                }

                return KeyEventResult.ignored;
              },
              child: FittedBox(
                child: Column(
                    children: ButtonsNotifier.defaultModels
                        .map((v) => _Button(model: v))
                        .toList()),
              )),
        ),
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button({required this.model});
  final ButtonModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(buttonProvider);
    bool focused = model.debugLabel == state.current?.debugLabel;

    return MouseRegion(
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
          if (model.onTap == null) {
            return;
          }
          model.onTap!(context, ref);
        },
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: focused && model.onTap != null
                  ? Colors.lightBlue.withOpacity(0.5)
                  : Colors.transparent),
          child: Center(
            child: Text(
              model.content,
              style: TextStyle(
                  color: model.onTap != null ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
