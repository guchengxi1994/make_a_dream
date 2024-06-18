import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'play_status/player_status_page.dart';

class PageWrapper extends ConsumerStatefulWidget {
  const PageWrapper({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends ConsumerState<PageWrapper> {
  final _key = GlobalKey<ExpandableFabState>();
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await player.setReleaseMode(ReleaseMode.loop);
      await player.play(AssetSource("audio/main_audio.mp3"),
          mode: PlayerMode.lowLatency);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
          key: _key,
          distance: 50,
          type: ExpandableFabType.side,
          children: [
            FloatingActionButton.small(
              tooltip: "status",
              heroTag: "status",
              onPressed: () {
                final state = _key.currentState;
                if (state != null) {
                  state.toggle();
                }
                showGeneralDialog(
                    context: context,
                    barrierColor: Colors.transparent,
                    pageBuilder: (c, _, __) {
                      return const Center(
                        child: PlayerStatusPage(),
                      );
                    });
              },
              child: const Icon(Icons.person),
            ),
            FloatingActionButton.small(
              tooltip: "setting",
              heroTag: "setting",
              onPressed: () {},
              child: const Icon(Icons.settings),
            ),
          ]),
    );
  }
}
