import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/components/play_status/avatar_widget.dart';
import 'package:make_a_dream/isar/player_record.dart';
import 'package:make_a_dream/opening_page/notifiers/player_notifier.dart';

import 'ability_adjust_form.dart';
import 'achievements_widget.dart';
import 'play_duration_widget.dart';

class PlayerStatusPage extends ConsumerStatefulWidget {
  const PlayerStatusPage({super.key});

  @override
  ConsumerState<PlayerStatusPage> createState() => _PlayerStatusPageState();
}

class _PlayerStatusPageState extends ConsumerState<PlayerStatusPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(playerProvider);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            LayoutGrid(
              columnSizes: [
                200.fr,
                200.fr,
                200.fr,
                200.fr,
              ],
              rowSizes: [
                200.fr,
                200.fr,
                200.fr,
              ],
              areas: """
ability knowledge avatar game_time
ability-adjust ability-adjust achievement achievement
ability-adjust ability-adjust achievement achievement
""",
              columnGap: 12,
              rowGap: 12,
              children: [
                state.current!.ability.toChart().inGridArea('ability'),
                state.current!.knowledge.toChart().inGridArea('knowledge'),
                AvatarWidget(
                  path: state.current!.avatar,
                ).inGridArea("avatar"),
                const PlayDurationWidget().inGridArea("game_time"),
                AchievementsWidget(
                  collection: state.current!.achievements.toSet(),
                ).inGridArea("achievement"),
                AbilityAdjustForm(
                  record: state.current!,
                ).inGridArea("ability-adjust")
              ],
            ),
            Positioned(
                right: 0,
                top: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 30,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
