import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'play_status/player_status_page.dart';

class PageWrapper extends ConsumerWidget {
  PageWrapper({super.key, required this.child});
  final Widget child;

  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
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
