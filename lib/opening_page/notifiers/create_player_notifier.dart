import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:make_a_dream/isar/player_record.dart';

class CreatePlayerState {
  String name;
  List<PlayerAbility> ability;
  List<PlayerKnowledge> knowledge;

  CreatePlayerState(
      {this.ability = const [], this.knowledge = const [], this.name = ""});

  CreatePlayerState copyWith(
      {String? name,
      List<PlayerAbility>? ability,
      List<PlayerKnowledge>? knowledge}) {
    return CreatePlayerState(
        name: name ?? this.name,
        ability: ability ?? this.ability,
        knowledge: knowledge ?? this.knowledge);
  }

  @override
  String toString() {
    return "name: $name, ability: $ability, knowledge: $knowledge";
  }
}

class CreatePlayerNotifier extends AutoDisposeNotifier<CreatePlayerState> {
  final PageController controller = PageController();

  @override
  CreatePlayerState build() {
    return CreatePlayerState();
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void addAbility(PlayerAbility ability) {
    state = state.copyWith(ability: [...state.ability, ability]);
  }

  void addKnowledge(PlayerKnowledge knowledge) {
    state = state.copyWith(knowledge: [...state.knowledge, knowledge]);
  }

  animateTo(int pageId) {
    controller.animateToPage(pageId,
        duration: const Duration(milliseconds: 500), curve: Curves.bounceIn);
  }
}

final createPlayerProvider =
    AutoDisposeNotifierProvider<CreatePlayerNotifier, CreatePlayerState>(
        () => CreatePlayerNotifier());
