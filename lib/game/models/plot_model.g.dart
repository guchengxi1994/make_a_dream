// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plots _$PlotsFromJson(Map<String, dynamic> json) => Plots(
      plots: (json['plots'] as List<dynamic>)
          .map((e) => Plot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlotsToJson(Plots instance) => <String, dynamic>{
      'plots': instance.plots,
    };

Plot _$PlotFromJson(Map<String, dynamic> json) => Plot(
      npc: json['npc'] as String,
      plot: (json['plot'] as List<dynamic>)
          .map((e) => PlotEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlotToJson(Plot instance) => <String, dynamic>{
      'npc': instance.npc,
      'plot': instance.plot,
    };

PlotEvent _$PlotEventFromJson(Map<String, dynamic> json) => PlotEvent(
      content: json['content'] as String,
      type: json['type'] as String,
      id: (json['id'] as num).toInt(),
      relatedAchievement: (json['relatedAchievement'] as num?)?.toInt(),
      requirements:
          Requirements.fromJson(json['requirements'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlotEventToJson(PlotEvent instance) => <String, dynamic>{
      'content': instance.content,
      'type': instance.type,
      'id': instance.id,
      'relatedAchievement': instance.relatedAchievement,
      'requirements': instance.requirements,
    };

Requirements _$RequirementsFromJson(Map<String, dynamic> json) => Requirements(
      endurance: (json['endurance'] as num).toInt(),
      intelligence: (json['intelligence'] as num).toInt(),
      strength: (json['strength'] as num).toInt(),
      attunement: (json['attunement'] as num).toInt(),
      dexterity: (json['dexterity'] as num).toInt(),
      vitality: (json['vitality'] as num).toInt(),
      math: (json['math'] as num).toInt(),
      language: (json['language'] as num).toInt(),
      history: (json['history'] as num).toInt(),
      geography: (json['geography'] as num).toInt(),
      chemistry: (json['chemistry'] as num).toInt(),
      physics: (json['physics'] as num).toInt(),
      biography: (json['biography'] as num).toInt(),
      it: (json['it'] as num).toInt(),
    );

Map<String, dynamic> _$RequirementsToJson(Requirements instance) =>
    <String, dynamic>{
      'endurance': instance.endurance,
      'intelligence': instance.intelligence,
      'strength': instance.strength,
      'attunement': instance.attunement,
      'dexterity': instance.dexterity,
      'vitality': instance.vitality,
      'math': instance.math,
      'language': instance.language,
      'history': instance.history,
      'geography': instance.geography,
      'chemistry': instance.chemistry,
      'physics': instance.physics,
      'biography': instance.biography,
      'it': instance.it,
    };
