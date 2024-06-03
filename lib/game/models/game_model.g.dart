// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      story: json['story'] as String,
      player: json['player'] as String,
      gameSystem: json['game-system'] as String,
      npcs: (json['npcs'] as List<dynamic>)
          .map((e) => Npc.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'story': instance.story,
      'player': instance.player,
      'game-system': instance.gameSystem,
      'npcs': instance.npcs,
    };

Npc _$NpcFromJson(Map<String, dynamic> json) => Npc(
      name: json['name'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$NpcToJson(Npc instance) => <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
    };
