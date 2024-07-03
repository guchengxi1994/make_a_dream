import 'package:json_annotation/json_annotation.dart';
import 'package:make_a_dream/game/models/base_quiz_model.dart';

part 'quiz_model.g.dart';

@JsonSerializable()
class QuizModel extends BaseQuizModel {
  final String quizType;

  QuizModel(
      {required this.quizType,
      required super.question,
      required super.options,
      required super.answer});

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$QuizModelToJson(this);
}
