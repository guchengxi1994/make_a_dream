import 'package:json_annotation/json_annotation.dart';
import 'package:make_a_dream/isar/npc.dart';
import 'package:make_a_dream/isar/player_record.dart';

part 'plot_model.g.dart';

@JsonSerializable()
class Plots {
  final List<Plot> plots;
  Plots({required this.plots});

  factory Plots.fromJson(Map<String, dynamic> json) => _$PlotsFromJson(json);
  Map<String, dynamic> toJson() => _$PlotsToJson(this);
}

@JsonSerializable()
class Plot {
  final String npc;
  final List<PlotEvent> plot;

  Plot({required this.npc, required this.plot});

  factory Plot.fromJson(Map<String, dynamic> json) => _$PlotFromJson(json);
  Map<String, dynamic> toJson() => _$PlotToJson(this);
}

@JsonSerializable()
class PlotEvent {
  final String content;
  final String type;
  final int id;
  @JsonKey(name: "related-achievement")
  final int? relatedAchievement;
  @JsonKey(name: "map-router")
  final String mapRouter;
  final List<double> position;
  final Requirements requirements;

  PlotEvent(
      {required this.content,
      required this.type,
      required this.id,
      required this.relatedAchievement,
      required this.requirements,
      required this.mapRouter,
      required this.position});

  factory PlotEvent.fromJson(Map<String, dynamic> json) =>
      _$PlotEventFromJson(json);
  Map<String, dynamic> toJson() => _$PlotEventToJson(this);
}

@JsonSerializable()
class Requirements {
  final int endurance;
  final int intelligence;
  final int strength;
  final int attunement;
  final int dexterity;
  final int vitality;
  final int math;
  final int language;
  final int history;
  final int geography;
  final int chemistry;
  final int physics;
  final int biography;
  final int it;
  final int likability;

  Requirements(
      {required this.endurance,
      required this.intelligence,
      required this.strength,
      required this.attunement,
      required this.dexterity,
      required this.vitality,
      required this.math,
      required this.language,
      required this.history,
      required this.geography,
      required this.chemistry,
      required this.physics,
      required this.biography,
      required this.it,
      required this.likability});

  factory Requirements.fromJson(Map<String, dynamic> json) =>
      _$RequirementsFromJson(json);
  Map<String, dynamic> toJson() => _$RequirementsToJson(this);

  bool match(PlayerKnowledge knowledge, PlayerAbility ability, Npc npc) {
    return (math <= knowledge.math &&
        language <= knowledge.language &&
        history <= knowledge.history &&
        geography <= knowledge.geography &&
        chemistry <= knowledge.chemistry &&
        physics <= knowledge.physics &&
        biography <= knowledge.biography &&
        it <= knowledge.it &&
        dexterity <= ability.dexterity &&
        endurance <= ability.endurance &&
        vitality <= ability.vitality &&
        attunement <= ability.attunement &&
        strength <= ability.strength &&
        intelligence <= ability.intelligence &&
        npc.likability >= likability);
  }
}
