// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleQuizModel _$RoleQuizModelFromJson(Map<String, dynamic> json) =>
    RoleQuizModel(
      quiz: (json['quiz'] as List<dynamic>)
          .map((e) => Quiz.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoleQuizModelToJson(RoleQuizModel instance) =>
    <String, dynamic>{
      'quiz': instance.quiz,
    };

Quiz _$QuizFromJson(Map<String, dynamic> json) => Quiz(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuizToJson(Quiz instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'options': instance.options,
    };

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      text: json['text'] as String,
      result: json['result'] as String,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'text': instance.text,
      'result': instance.result,
    };
