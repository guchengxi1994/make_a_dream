// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterQuizModel _$CharacterQuizModelFromJson(Map<String, dynamic> json) =>
    CharacterQuizModel(
      reason: json['reason'] as String,
      quiz: json['quiz'] as String,
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$CharacterQuizModelToJson(CharacterQuizModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'options': instance.options,
      'answer': instance.answer,
      'reason': instance.reason,
      'quiz': instance.quiz,
    };
