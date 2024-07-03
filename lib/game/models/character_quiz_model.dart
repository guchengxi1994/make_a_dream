import 'package:json_annotation/json_annotation.dart';
import 'package:make_a_dream/game/models/base_quiz_model.dart';

part 'character_quiz_model.g.dart';

@JsonSerializable()
class CharacterQuizModel extends BaseQuizModel {
  final String reason;
  final String quiz;

  CharacterQuizModel(
      {required this.reason,
      required this.quiz,
      required super.question,
      required super.options,
      required super.answer});

  factory CharacterQuizModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterQuizModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CharacterQuizModelToJson(this);
}
