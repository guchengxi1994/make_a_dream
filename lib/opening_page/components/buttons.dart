import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/maps/game_initial_route.dart';
import 'package:make_a_dream/opening_page/components/create_player_dialog.dart';
import 'package:make_a_dream/opening_page/notifiers/player_notifier.dart';

class OpeningScreenButtons extends ConsumerWidget {
  const OpeningScreenButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerProvider);

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
          child: FittedBox(
            child: Column(children: [
              _Button(
                  content: "起",
                  onTap: () async {
                    final String? name = await showGeneralDialog(
                        barrierColor: Colors.transparent,
                        barrierDismissible: true,
                        barrierLabel: "new-player",
                        context: context,
                        pageBuilder: (c, _, __) {
                          return Center(
                            child: CreatePlayerDialog(),
                          );
                        });

                    if (name != null) {
                      ref
                          .read(playerProvider.notifier)
                          .createNewRecord(name)
                          .then((_) {
                        GameInitialRoute.open(context);
                      });
                    }
                  },
                  enable: true),
              _Button(
                  content: "承",
                  onTap: () {
                    final last = playerState.records.lastOrNull;
                    if (last == null) {
                      return;
                    }

                    ref.read(playerProvider.notifier).changeCurrent(last);
                    GameInitialRoute.open(context);
                  },
                  enable: playerState.records.isNotEmpty),
              _Button(content: "转", onTap: () {}, enable: false),
              _Button(
                  content: "合",
                  onTap: () {
                    // SystemNavigator.pop();
                    exit(0);
                  },
                  enable: true),
            ]),
          ),
        ),
      ),
    );
  }
}

class _Button extends StatefulWidget {
  const _Button(
      {required this.content, required this.onTap, required this.enable});
  final VoidCallback onTap;
  final String content;
  final bool enable;

  @override
  State<_Button> createState() => __ButtonState();
}

class __ButtonState extends State<_Button> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return widget.enable
        ? MouseRegion(
            onEnter: (event) {
              setState(() {
                onHover = true;
              });
            },
            onExit: (event) {
              setState(() {
                onHover = false;
              });
            },
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                widget.onTap();
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: onHover
                        ? Colors.lightBlue.withOpacity(0.5)
                        : Colors.transparent),
                child: Center(
                  child: Text(
                    widget.content,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
            ),
          )
        : SizedBox(
            width: 200,
            height: 50,
            child: Center(
              child: Text(
                widget.content,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          );
  }
}
