// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseQuizModel _$BaseQuizModelFromJson(Map<String, dynamic> json) =>
    BaseQuizModel(
      question: json['question'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$BaseQuizModelToJson(BaseQuizModel instance) =>
    <String, dynamic>{
      'question': instance.question,
      'options': instance.options,
      'answer': instance.answer,
    };
