import 'package:json_annotation/json_annotation.dart';

part 'base_quiz_model.g.dart';

@JsonSerializable()
class BaseQuizModel {
  final String question;
  final List<String> options;
  final String answer;

  BaseQuizModel(
      {required this.question, required this.options, required this.answer});

  factory BaseQuizModel.fromJson(Map<String, dynamic> json) =>
      _$BaseQuizModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseQuizModelToJson(this);
}
