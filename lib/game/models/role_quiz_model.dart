import 'package:json_annotation/json_annotation.dart';

part 'role_quiz_model.g.dart';

@JsonSerializable()
class RoleQuizModel {
  final List<Quiz> quiz;

  RoleQuizModel({required this.quiz});

  factory RoleQuizModel.fromJson(Map<String, dynamic> json) =>
      _$RoleQuizModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoleQuizModelToJson(this);
}

@JsonSerializable()
class Quiz {
  int id;
  String question;
  List<Option> options;

  Quiz({required this.id, required this.question, required this.options});

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
  Map<String, dynamic> toJson() => _$QuizToJson(this);
}

@JsonSerializable()
class Option {
  String text;
  String result;

  Option({required this.text, required this.result});

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
