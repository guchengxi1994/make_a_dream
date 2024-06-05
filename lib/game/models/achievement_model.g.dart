// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Achievement _$AchievementFromJson(Map<String, dynamic> json) => Achievement(
      id: (json['id'] as num).toInt(),
      description: json['description'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$AchievementToJson(Achievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'image': instance.image,
      'name': instance.name,
    };

AchievementsList _$AchievementsListFromJson(Map<String, dynamic> json) =>
    AchievementsList(
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AchievementsListToJson(AchievementsList instance) =>
    <String, dynamic>{
      'achievements': instance.achievements,
    };
