import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel {
  final String story;
  final String player;
  @JsonKey(name: "game-system")
  final String gameSystem;
  final List<Npc> npcs;

  GameModel({
    required this.story,
    required this.player,
    required this.gameSystem,
    required this.npcs,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}

@JsonSerializable()
class Npc {
  final String name;
  final String role;
  final String avatar;

  Npc({required this.name, required this.role, required this.avatar});

  factory Npc.fromJson(Map<String, dynamic> json) => _$NpcFromJson(json);

  Map<String, dynamic> toJson() => _$NpcToJson(this);
}
