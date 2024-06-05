import 'package:json_annotation/json_annotation.dart';

part 'achievement_model.g.dart';

@JsonSerializable()
class Achievement {
  final int id;
  final String description;
  final String image;
  final String name;

  Achievement({
    required this.id,
    required this.description,
    required this.image,
    required this.name,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
  Map<String, dynamic> toJson() => _$AchievementToJson(this);
}

@JsonSerializable()
class AchievementsList {
  final List<Achievement> achievements;

  AchievementsList({required this.achievements});

  factory AchievementsList.fromJson(Map<String, dynamic> json) =>
      _$AchievementsListFromJson(json);
  Map<String, dynamic> toJson() => _$AchievementsListToJson(this);
}
