// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'npc.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNpcCollection on Isar {
  IsarCollection<Npc> get npcs => this.collection();
}

const NpcSchema = CollectionSchema(
  name: r'Npc',
  id: -805560602275302924,
  properties: {
    r'history': PropertySchema(
      id: 0,
      name: r'history',
      type: IsarType.objectList,
      target: r'History',
    ),
    r'likability': PropertySchema(
      id: 1,
      name: r'likability',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'stage': PropertySchema(
      id: 3,
      name: r'stage',
      type: IsarType.byte,
      enumMap: _NpcstageEnumValueMap,
    )
  },
  estimateSize: _npcEstimateSize,
  serialize: _npcSerialize,
  deserialize: _npcDeserialize,
  deserializeProp: _npcDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'History': HistorySchema},
  getId: _npcGetId,
  getLinks: _npcGetLinks,
  attach: _npcAttach,
  version: '3.1.0',
);

int _npcEstimateSize(
  Npc object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.history.length * 3;
  {
    final offsets = allOffsets[History]!;
    for (var i = 0; i < object.history.length; i++) {
      final value = object.history[i];
      bytesCount += HistorySchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _npcSerialize(
  Npc object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<History>(
    offsets[0],
    allOffsets,
    HistorySchema.serialize,
    object.history,
  );
  writer.writeLong(offsets[1], object.likability);
  writer.writeString(offsets[2], object.name);
  writer.writeByte(offsets[3], object.stage.index);
}

Npc _npcDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Npc();
  object.history = reader.readObjectList<History>(
        offsets[0],
        HistorySchema.deserialize,
        allOffsets,
        History(),
      ) ??
      [];
  object.id = id;
  object.likability = reader.readLong(offsets[1]);
  object.name = reader.readString(offsets[2]);
  object.stage =
      _NpcstageValueEnumMap[reader.readByteOrNull(offsets[3])] ?? NpcStage.meet;
  return object;
}

P _npcDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<History>(
            offset,
            HistorySchema.deserialize,
            allOffsets,
            History(),
          ) ??
          []) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_NpcstageValueEnumMap[reader.readByteOrNull(offset)] ??
          NpcStage.meet) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _NpcstageEnumValueMap = {
  'meet': 0,
  'unknow': 1,
  'admire': 2,
};
const _NpcstageValueEnumMap = {
  0: NpcStage.meet,
  1: NpcStage.unknow,
  2: NpcStage.admire,
};

Id _npcGetId(Npc object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _npcGetLinks(Npc object) {
  return [];
}

void _npcAttach(IsarCollection<dynamic> col, Id id, Npc object) {
  object.id = id;
}

extension NpcQueryWhereSort on QueryBuilder<Npc, Npc, QWhere> {
  QueryBuilder<Npc, Npc, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension NpcQueryWhere on QueryBuilder<Npc, Npc, QWhereClause> {
  QueryBuilder<Npc, Npc, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Npc, Npc, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Npc, Npc, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Npc, Npc, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NpcQueryFilter on QueryBuilder<Npc, Npc, QFilterCondition> {
  QueryBuilder<Npc, Npc, QAfterFilterCondition> historyLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'history',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> historyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'history',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> historyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'history',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> historyLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'history',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> historyLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'history',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> historyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'history',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> likabilityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'likability',
        value: value,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> likabilityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'likability',
        value: value,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> likabilityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'likability',
        value: value,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> likabilityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'likability',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> stageEqualTo(NpcStage value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stage',
        value: value,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> stageGreaterThan(
    NpcStage value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stage',
        value: value,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> stageLessThan(
    NpcStage value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stage',
        value: value,
      ));
    });
  }

  QueryBuilder<Npc, Npc, QAfterFilterCondition> stageBetween(
    NpcStage lower,
    NpcStage upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NpcQueryObject on QueryBuilder<Npc, Npc, QFilterCondition> {
  QueryBuilder<Npc, Npc, QAfterFilterCondition> historyElement(
      FilterQuery<History> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'history');
    });
  }
}

extension NpcQueryLinks on QueryBuilder<Npc, Npc, QFilterCondition> {}

extension NpcQuerySortBy on QueryBuilder<Npc, Npc, QSortBy> {
  QueryBuilder<Npc, Npc, QAfterSortBy> sortByLikability() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likability', Sort.asc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> sortByLikabilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likability', Sort.desc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> sortByStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.asc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> sortByStageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.desc);
    });
  }
}

extension NpcQuerySortThenBy on QueryBuilder<Npc, Npc, QSortThenBy> {
  QueryBuilder<Npc, Npc, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> thenByLikability() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likability', Sort.asc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> thenByLikabilityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'likability', Sort.desc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> thenByStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.asc);
    });
  }

  QueryBuilder<Npc, Npc, QAfterSortBy> thenByStageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stage', Sort.desc);
    });
  }
}

extension NpcQueryWhereDistinct on QueryBuilder<Npc, Npc, QDistinct> {
  QueryBuilder<Npc, Npc, QDistinct> distinctByLikability() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'likability');
    });
  }

  QueryBuilder<Npc, Npc, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Npc, Npc, QDistinct> distinctByStage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stage');
    });
  }
}

extension NpcQueryProperty on QueryBuilder<Npc, Npc, QQueryProperty> {
  QueryBuilder<Npc, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Npc, List<History>, QQueryOperations> historyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'history');
    });
  }

  QueryBuilder<Npc, int, QQueryOperations> likabilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'likability');
    });
  }

  QueryBuilder<Npc, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Npc, NpcStage, QQueryOperations> stageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stage');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const HistorySchema = Schema(
  name: r'History',
  id: 1676981785059398080,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.string,
    ),
    r'createAt': PropertySchema(
      id: 1,
      name: r'createAt',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 2,
      name: r'type',
      type: IsarType.byte,
      enumMap: _HistorytypeEnumValueMap,
    )
  },
  estimateSize: _historyEstimateSize,
  serialize: _historySerialize,
  deserialize: _historyDeserialize,
  deserializeProp: _historyDeserializeProp,
);

int _historyEstimateSize(
  History object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.content.length * 3;
  return bytesCount;
}

void _historySerialize(
  History object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeLong(offsets[1], object.createAt);
  writer.writeByte(offsets[2], object.type.index);
}

History _historyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = History();
  object.content = reader.readString(offsets[0]);
  object.createAt = reader.readLong(offsets[1]);
  object.type = _HistorytypeValueEnumMap[reader.readByteOrNull(offsets[2])] ??
      HistoryType.player;
  return object;
}

P _historyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (_HistorytypeValueEnumMap[reader.readByteOrNull(offset)] ??
          HistoryType.player) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _HistorytypeEnumValueMap = {
  'player': 0,
  'npc': 1,
};
const _HistorytypeValueEnumMap = {
  0: HistoryType.player,
  1: HistoryType.npc,
};

extension HistoryQueryFilter
    on QueryBuilder<History, History, QFilterCondition> {
  QueryBuilder<History, History, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> createAtEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> createAtGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> createAtLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> createAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> typeEqualTo(
      HistoryType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> typeGreaterThan(
    HistoryType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> typeLessThan(
    HistoryType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<History, History, QAfterFilterCondition> typeBetween(
    HistoryType lower,
    HistoryType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HistoryQueryObject
    on QueryBuilder<History, History, QFilterCondition> {}
