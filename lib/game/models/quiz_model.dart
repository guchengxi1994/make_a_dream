import 'package:json_annotation/json_annotation.dart';

part 'quiz_model.g.dart';

@JsonSerializable()
class QuizModel {
  final String question;
  final List<String> options;
  final String answer;
  final String quizType;

  QuizModel(
      {required this.question,
      required this.options,
      required this.answer,
      required this.quizType});

  factory QuizModel.fromJson(Map<String, dynamic> json) =>
      _$QuizModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuizModelToJson(this);
}
