import 'package:flutter/material.dart';
import 'package:make_a_dream/game/components/play_status/achievement_widget.dart';
import 'package:make_a_dream/isar/player_record.dart';

import 'widget_wrapper.dart';

class AchievementsWidget extends StatelessWidget {
  const AchievementsWidget({super.key, required this.collection});
  final Set<Achievement> collection;

  @override
  Widget build(BuildContext context) {
    return WidgetWrapper(
      child: Container(
        padding: const EdgeInsets.all(10),
        // width: 200,
        // height: 50,
        alignment: Alignment.topLeft,
        child: Wrap(
          runSpacing: 8,
          spacing: 8,
          children:
              collection.map((e) => AchievementWidget(achievement: e)).toList(),
        ),
      ),
    );
  }
}
