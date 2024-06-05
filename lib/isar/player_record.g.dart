// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlayerRecordCollection on Isar {
  IsarCollection<PlayerRecord> get playerRecords => this.collection();
}

const PlayerRecordSchema = CollectionSchema(
  name: r'PlayerRecord',
  id: 2018535135121942839,
  properties: {
    r'ability': PropertySchema(
      id: 0,
      name: r'ability',
      type: IsarType.object,
      target: r'PlayerAbility',
    ),
    r'achievements': PropertySchema(
      id: 1,
      name: r'achievements',
      type: IsarType.objectList,
      target: r'Achievement',
    ),
    r'attributes': PropertySchema(
      id: 2,
      name: r'attributes',
      type: IsarType.long,
    ),
    r'avatar': PropertySchema(
      id: 3,
      name: r'avatar',
      type: IsarType.string,
    ),
    r'createAt': PropertySchema(
      id: 4,
      name: r'createAt',
      type: IsarType.long,
    ),
    r'duration': PropertySchema(
      id: 5,
      name: r'duration',
      type: IsarType.long,
    ),
    r'knowledge': PropertySchema(
      id: 6,
      name: r'knowledge',
      type: IsarType.object,
      target: r'PlayerKnowledge',
    ),
    r'lastSaved': PropertySchema(
      id: 7,
      name: r'lastSaved',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _playerRecordEstimateSize,
  serialize: _playerRecordSerialize,
  deserialize: _playerRecordDeserialize,
  deserializeProp: _playerRecordDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'PlayerAbility': PlayerAbilitySchema,
    r'PlayerKnowledge': PlayerKnowledgeSchema,
    r'Achievement': AchievementSchema
  },
  getId: _playerRecordGetId,
  getLinks: _playerRecordGetLinks,
  attach: _playerRecordAttach,
  version: '3.1.0',
);

int _playerRecordEstimateSize(
  PlayerRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      PlayerAbilitySchema.estimateSize(
          object.ability, allOffsets[PlayerAbility]!, allOffsets);
  bytesCount += 3 + object.achievements.length * 3;
  {
    final offsets = allOffsets[Achievement]!;
    for (var i = 0; i < object.achievements.length; i++) {
      final value = object.achievements[i];
      bytesCount += AchievementSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.avatar;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 +
      PlayerKnowledgeSchema.estimateSize(
          object.knowledge, allOffsets[PlayerKnowledge]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _playerRecordSerialize(
  PlayerRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<PlayerAbility>(
    offsets[0],
    allOffsets,
    PlayerAbilitySchema.serialize,
    object.ability,
  );
  writer.writeObjectList<Achievement>(
    offsets[1],
    allOffsets,
    AchievementSchema.serialize,
    object.achievements,
  );
  writer.writeLong(offsets[2], object.attributes);
  writer.writeString(offsets[3], object.avatar);
  writer.writeLong(offsets[4], object.createAt);
  writer.writeLong(offsets[5], object.duration);
  writer.writeObject<PlayerKnowledge>(
    offsets[6],
    allOffsets,
    PlayerKnowledgeSchema.serialize,
    object.knowledge,
  );
  writer.writeLong(offsets[7], object.lastSaved);
  writer.writeString(offsets[8], object.name);
}

PlayerRecord _playerRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlayerRecord();
  object.ability = reader.readObjectOrNull<PlayerAbility>(
        offsets[0],
        PlayerAbilitySchema.deserialize,
        allOffsets,
      ) ??
      PlayerAbility();
  object.achievements = reader.readObjectList<Achievement>(
        offsets[1],
        AchievementSchema.deserialize,
        allOffsets,
        Achievement(),
      ) ??
      [];
  object.attributes = reader.readLong(offsets[2]);
  object.avatar = reader.readStringOrNull(offsets[3]);
  object.createAt = reader.readLong(offsets[4]);
  object.duration = reader.readLong(offsets[5]);
  object.id = id;
  object.knowledge = reader.readObjectOrNull<PlayerKnowledge>(
        offsets[6],
        PlayerKnowledgeSchema.deserialize,
        allOffsets,
      ) ??
      PlayerKnowledge();
  object.lastSaved = reader.readLongOrNull(offsets[7]);
  object.name = reader.readString(offsets[8]);
  return object;
}

P _playerRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<PlayerAbility>(
            offset,
            PlayerAbilitySchema.deserialize,
            allOffsets,
          ) ??
          PlayerAbility()) as P;
    case 1:
      return (reader.readObjectList<Achievement>(
            offset,
            AchievementSchema.deserialize,
            allOffsets,
            Achievement(),
          ) ??
          []) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readObjectOrNull<PlayerKnowledge>(
            offset,
            PlayerKnowledgeSchema.deserialize,
            allOffsets,
          ) ??
          PlayerKnowledge()) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _playerRecordGetId(PlayerRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _playerRecordGetLinks(PlayerRecord object) {
  return [];
}

void _playerRecordAttach(
    IsarCollection<dynamic> col, Id id, PlayerRecord object) {
  object.id = id;
}

extension PlayerRecordQueryWhereSort
    on QueryBuilder<PlayerRecord, PlayerRecord, QWhere> {
  QueryBuilder<PlayerRecord, PlayerRecord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlayerRecordQueryWhere
    on QueryBuilder<PlayerRecord, PlayerRecord, QWhereClause> {
  QueryBuilder<PlayerRecord, PlayerRecord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterWhereClause> idBetween(
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

extension PlayerRecordQueryFilter
    on QueryBuilder<PlayerRecord, PlayerRecord, QFilterCondition> {
  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      achievementsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      achievementsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      achievementsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      achievementsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      achievementsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      achievementsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'achievements',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      attributesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attributes',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      attributesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attributes',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      attributesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attributes',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      attributesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attributes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      avatarIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      avatarIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'avatar',
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> avatarEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      avatarGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      avatarLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> avatarBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatar',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      avatarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      avatarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      avatarContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatar',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> avatarMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatar',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      avatarIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      avatarIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatar',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      createAtEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      createAtGreaterThan(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      createAtLessThan(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      createAtBetween(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      durationEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      durationGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      durationLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      durationBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      lastSavedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastSaved',
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      lastSavedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastSaved',
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      lastSavedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      lastSavedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      lastSavedLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSaved',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      lastSavedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSaved',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension PlayerRecordQueryObject
    on QueryBuilder<PlayerRecord, PlayerRecord, QFilterCondition> {
  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> ability(
      FilterQuery<PlayerAbility> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ability');
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition>
      achievementsElement(FilterQuery<Achievement> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'achievements');
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterFilterCondition> knowledge(
      FilterQuery<PlayerKnowledge> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'knowledge');
    });
  }
}

extension PlayerRecordQueryLinks
    on QueryBuilder<PlayerRecord, PlayerRecord, QFilterCondition> {}

extension PlayerRecordQuerySortBy
    on QueryBuilder<PlayerRecord, PlayerRecord, QSortBy> {
  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> sortByAttributes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attributes', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy>
      sortByAttributesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attributes', Sort.desc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> sortByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> sortByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> sortByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> sortByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> sortByLastSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSaved', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> sortByLastSavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSaved', Sort.desc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PlayerRecordQuerySortThenBy
    on QueryBuilder<PlayerRecord, PlayerRecord, QSortThenBy> {
  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByAttributes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attributes', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy>
      thenByAttributesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attributes', Sort.desc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByAvatar() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByAvatarDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatar', Sort.desc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByLastSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSaved', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByLastSavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSaved', Sort.desc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension PlayerRecordQueryWhereDistinct
    on QueryBuilder<PlayerRecord, PlayerRecord, QDistinct> {
  QueryBuilder<PlayerRecord, PlayerRecord, QDistinct> distinctByAttributes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attributes');
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QDistinct> distinctByAvatar(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatar', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QDistinct> distinctByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createAt');
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QDistinct> distinctByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration');
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QDistinct> distinctByLastSaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSaved');
    });
  }

  QueryBuilder<PlayerRecord, PlayerRecord, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension PlayerRecordQueryProperty
    on QueryBuilder<PlayerRecord, PlayerRecord, QQueryProperty> {
  QueryBuilder<PlayerRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlayerRecord, PlayerAbility, QQueryOperations>
      abilityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ability');
    });
  }

  QueryBuilder<PlayerRecord, List<Achievement>, QQueryOperations>
      achievementsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'achievements');
    });
  }

  QueryBuilder<PlayerRecord, int, QQueryOperations> attributesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attributes');
    });
  }

  QueryBuilder<PlayerRecord, String?, QQueryOperations> avatarProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatar');
    });
  }

  QueryBuilder<PlayerRecord, int, QQueryOperations> createAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createAt');
    });
  }

  QueryBuilder<PlayerRecord, int, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<PlayerRecord, PlayerKnowledge, QQueryOperations>
      knowledgeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'knowledge');
    });
  }

  QueryBuilder<PlayerRecord, int?, QQueryOperations> lastSavedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSaved');
    });
  }

  QueryBuilder<PlayerRecord, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AchievementSchema = Schema(
  name: r'Achievement',
  id: -1511299366265280024,
  properties: {
    r'createAt': PropertySchema(
      id: 0,
      name: r'createAt',
      type: IsarType.long,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'iconPath': PropertySchema(
      id: 2,
      name: r'iconPath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _achievementEstimateSize,
  serialize: _achievementSerialize,
  deserialize: _achievementDeserialize,
  deserializeProp: _achievementDeserializeProp,
);

int _achievementEstimateSize(
  Achievement object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  {
    final value = object.iconPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _achievementSerialize(
  Achievement object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.createAt);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.iconPath);
  writer.writeString(offsets[3], object.name);
}

Achievement _achievementDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Achievement();
  object.createAt = reader.readLong(offsets[0]);
  object.description = reader.readString(offsets[1]);
  object.iconPath = reader.readStringOrNull(offsets[2]);
  object.name = reader.readString(offsets[3]);
  return object;
}

P _achievementDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AchievementQueryFilter
    on QueryBuilder<Achievement, Achievement, QFilterCondition> {
  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> createAtEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      createAtGreaterThan(
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

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      createAtLessThan(
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

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> createAtBetween(
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

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      iconPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'iconPath',
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      iconPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'iconPath',
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> iconPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      iconPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      iconPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> iconPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'iconPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      iconPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      iconPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      iconPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'iconPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> iconPathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'iconPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      iconPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'iconPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      iconPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'iconPath',
        value: '',
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Achievement, Achievement, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension AchievementQueryObject
    on QueryBuilder<Achievement, Achievement, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PlayerAbilitySchema = Schema(
  name: r'PlayerAbility',
  id: -6101649756571831878,
  properties: {
    r'attunement': PropertySchema(
      id: 0,
      name: r'attunement',
      type: IsarType.double,
    ),
    r'dexterity': PropertySchema(
      id: 1,
      name: r'dexterity',
      type: IsarType.double,
    ),
    r'endurance': PropertySchema(
      id: 2,
      name: r'endurance',
      type: IsarType.double,
    ),
    r'intelligence': PropertySchema(
      id: 3,
      name: r'intelligence',
      type: IsarType.double,
    ),
    r'strength': PropertySchema(
      id: 4,
      name: r'strength',
      type: IsarType.double,
    ),
    r'vitality': PropertySchema(
      id: 5,
      name: r'vitality',
      type: IsarType.double,
    )
  },
  estimateSize: _playerAbilityEstimateSize,
  serialize: _playerAbilitySerialize,
  deserialize: _playerAbilityDeserialize,
  deserializeProp: _playerAbilityDeserializeProp,
);

int _playerAbilityEstimateSize(
  PlayerAbility object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _playerAbilitySerialize(
  PlayerAbility object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.attunement);
  writer.writeDouble(offsets[1], object.dexterity);
  writer.writeDouble(offsets[2], object.endurance);
  writer.writeDouble(offsets[3], object.intelligence);
  writer.writeDouble(offsets[4], object.strength);
  writer.writeDouble(offsets[5], object.vitality);
}

PlayerAbility _playerAbilityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlayerAbility();
  object.attunement = reader.readDouble(offsets[0]);
  object.dexterity = reader.readDouble(offsets[1]);
  object.endurance = reader.readDouble(offsets[2]);
  object.intelligence = reader.readDouble(offsets[3]);
  object.strength = reader.readDouble(offsets[4]);
  object.vitality = reader.readDouble(offsets[5]);
  return object;
}

P _playerAbilityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PlayerAbilityQueryFilter
    on QueryBuilder<PlayerAbility, PlayerAbility, QFilterCondition> {
  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      attunementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attunement',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      attunementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attunement',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      attunementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attunement',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      attunementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attunement',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      dexterityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dexterity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      dexterityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dexterity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      dexterityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dexterity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      dexterityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dexterity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      enduranceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'endurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      enduranceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'endurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      enduranceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'endurance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      enduranceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'endurance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      intelligenceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intelligence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      intelligenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intelligence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      intelligenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intelligence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      intelligenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intelligence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      strengthEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'strength',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      strengthGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'strength',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      strengthLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'strength',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      strengthBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'strength',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      vitalityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'vitality',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      vitalityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'vitality',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      vitalityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'vitality',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerAbility, PlayerAbility, QAfterFilterCondition>
      vitalityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'vitality',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PlayerAbilityQueryObject
    on QueryBuilder<PlayerAbility, PlayerAbility, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PlayerKnowledgeSchema = Schema(
  name: r'PlayerKnowledge',
  id: 3872572374257565983,
  properties: {
    r'biography': PropertySchema(
      id: 0,
      name: r'biography',
      type: IsarType.double,
    ),
    r'chemistry': PropertySchema(
      id: 1,
      name: r'chemistry',
      type: IsarType.double,
    ),
    r'geography': PropertySchema(
      id: 2,
      name: r'geography',
      type: IsarType.double,
    ),
    r'history': PropertySchema(
      id: 3,
      name: r'history',
      type: IsarType.double,
    ),
    r'it': PropertySchema(
      id: 4,
      name: r'it',
      type: IsarType.double,
    ),
    r'language': PropertySchema(
      id: 5,
      name: r'language',
      type: IsarType.double,
    ),
    r'math': PropertySchema(
      id: 6,
      name: r'math',
      type: IsarType.double,
    ),
    r'physics': PropertySchema(
      id: 7,
      name: r'physics',
      type: IsarType.double,
    )
  },
  estimateSize: _playerKnowledgeEstimateSize,
  serialize: _playerKnowledgeSerialize,
  deserialize: _playerKnowledgeDeserialize,
  deserializeProp: _playerKnowledgeDeserializeProp,
);

int _playerKnowledgeEstimateSize(
  PlayerKnowledge object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _playerKnowledgeSerialize(
  PlayerKnowledge object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.biography);
  writer.writeDouble(offsets[1], object.chemistry);
  writer.writeDouble(offsets[2], object.geography);
  writer.writeDouble(offsets[3], object.history);
  writer.writeDouble(offsets[4], object.it);
  writer.writeDouble(offsets[5], object.language);
  writer.writeDouble(offsets[6], object.math);
  writer.writeDouble(offsets[7], object.physics);
}

PlayerKnowledge _playerKnowledgeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlayerKnowledge();
  object.biography = reader.readDouble(offsets[0]);
  object.chemistry = reader.readDouble(offsets[1]);
  object.geography = reader.readDouble(offsets[2]);
  object.history = reader.readDouble(offsets[3]);
  object.it = reader.readDouble(offsets[4]);
  object.language = reader.readDouble(offsets[5]);
  object.math = reader.readDouble(offsets[6]);
  object.physics = reader.readDouble(offsets[7]);
  return object;
}

P _playerKnowledgeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PlayerKnowledgeQueryFilter
    on QueryBuilder<PlayerKnowledge, PlayerKnowledge, QFilterCondition> {
  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      biographyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'biography',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      biographyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'biography',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      biographyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'biography',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      biographyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'biography',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      chemistryEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chemistry',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      chemistryGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chemistry',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      chemistryLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chemistry',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      chemistryBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chemistry',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      geographyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'geography',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      geographyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'geography',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      geographyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'geography',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      geographyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'geography',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      historyEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'history',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      historyGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'history',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      historyLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'history',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      historyBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'history',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      itEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'it',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      itGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'it',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      itLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'it',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      itBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'it',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      languageEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'language',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      languageGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'language',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      languageLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'language',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      languageBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'language',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      mathEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'math',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      mathGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'math',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      mathLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'math',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      mathBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'math',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      physicsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'physics',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      physicsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'physics',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      physicsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'physics',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PlayerKnowledge, PlayerKnowledge, QAfterFilterCondition>
      physicsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'physics',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PlayerKnowledgeQueryObject
    on QueryBuilder<PlayerKnowledge, PlayerKnowledge, QFilterCondition> {}
