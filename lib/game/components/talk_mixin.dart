import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/game/notifiers/player_notifier.dart';
import 'package:make_a_dream/isar/player_record.dart';

mixin TalkMixin<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  addLikability(int i, String npcName) {
    ref.read(playerProvider.notifier).addLikability(npcName, i);
  }

  addKnowledge(PlayerKnowledge knowledge) {
    ref.read(playerProvider.notifier).addKnowledge(knowledge);
  }

  addAbility(PlayerAbility ability) {
    ref.read(playerProvider.notifier).addAbility(ability);
  }
}
