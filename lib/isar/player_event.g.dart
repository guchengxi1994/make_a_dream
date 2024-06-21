// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_event.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPlayerEventCollection on Isar {
  IsarCollection<PlayerEvent> get playerEvents => this.collection();
}

const PlayerEventSchema = CollectionSchema(
  name: r'PlayerEvent',
  id: 884961824799793752,
  properties: {
    r'createAt': PropertySchema(
      id: 0,
      name: r'createAt',
      type: IsarType.long,
    ),
    r'playerEventType': PropertySchema(
      id: 1,
      name: r'playerEventType',
      type: IsarType.byte,
      enumMap: _PlayerEventplayerEventTypeEnumValueMap,
    ),
    r'withWhom': PropertySchema(
      id: 2,
      name: r'withWhom',
      type: IsarType.string,
    )
  },
  estimateSize: _playerEventEstimateSize,
  serialize: _playerEventSerialize,
  deserialize: _playerEventDeserialize,
  deserializeProp: _playerEventDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _playerEventGetId,
  getLinks: _playerEventGetLinks,
  attach: _playerEventAttach,
  version: '3.1.0',
);

int _playerEventEstimateSize(
  PlayerEvent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.withWhom;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _playerEventSerialize(
  PlayerEvent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.createAt);
  writer.writeByte(offsets[1], object.playerEventType.index);
  writer.writeString(offsets[2], object.withWhom);
}

PlayerEvent _playerEventDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PlayerEvent();
  object.createAt = reader.readLong(offsets[0]);
  object.id = id;
  object.playerEventType = _PlayerEventplayerEventTypeValueEnumMap[
          reader.readByteOrNull(offsets[1])] ??
      PlayerEventType.talk;
  object.withWhom = reader.readStringOrNull(offsets[2]);
  return object;
}

P _playerEventDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (_PlayerEventplayerEventTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          PlayerEventType.talk) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PlayerEventplayerEventTypeEnumValueMap = {
  'talk': 0,
  'exam': 1,
  'mission': 2,
};
const _PlayerEventplayerEventTypeValueEnumMap = {
  0: PlayerEventType.talk,
  1: PlayerEventType.exam,
  2: PlayerEventType.mission,
};

Id _playerEventGetId(PlayerEvent object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _playerEventGetLinks(PlayerEvent object) {
  return [];
}

void _playerEventAttach(
    IsarCollection<dynamic> col, Id id, PlayerEvent object) {
  object.id = id;
}

extension PlayerEventQueryWhereSort
    on QueryBuilder<PlayerEvent, PlayerEvent, QWhere> {
  QueryBuilder<PlayerEvent, PlayerEvent, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PlayerEventQueryWhere
    on QueryBuilder<PlayerEvent, PlayerEvent, QWhereClause> {
  QueryBuilder<PlayerEvent, PlayerEvent, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterWhereClause> idBetween(
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

extension PlayerEventQueryFilter
    on QueryBuilder<PlayerEvent, PlayerEvent, QFilterCondition> {
  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition> createAtEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createAt',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
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

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
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

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition> createAtBetween(
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

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      playerEventTypeEqualTo(PlayerEventType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerEventType',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      playerEventTypeGreaterThan(
    PlayerEventType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playerEventType',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      playerEventTypeLessThan(
    PlayerEventType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playerEventType',
        value: value,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      playerEventTypeBetween(
    PlayerEventType lower,
    PlayerEventType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playerEventType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      withWhomIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'withWhom',
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      withWhomIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'withWhom',
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition> withWhomEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'withWhom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      withWhomGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'withWhom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      withWhomLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'withWhom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition> withWhomBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'withWhom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      withWhomStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'withWhom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      withWhomEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'withWhom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      withWhomContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'withWhom',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition> withWhomMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'withWhom',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      withWhomIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'withWhom',
        value: '',
      ));
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterFilterCondition>
      withWhomIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'withWhom',
        value: '',
      ));
    });
  }
}

extension PlayerEventQueryObject
    on QueryBuilder<PlayerEvent, PlayerEvent, QFilterCondition> {}

extension PlayerEventQueryLinks
    on QueryBuilder<PlayerEvent, PlayerEvent, QFilterCondition> {}

extension PlayerEventQuerySortBy
    on QueryBuilder<PlayerEvent, PlayerEvent, QSortBy> {
  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> sortByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> sortByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> sortByPlayerEventType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerEventType', Sort.asc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy>
      sortByPlayerEventTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerEventType', Sort.desc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> sortByWithWhom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withWhom', Sort.asc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> sortByWithWhomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withWhom', Sort.desc);
    });
  }
}

extension PlayerEventQuerySortThenBy
    on QueryBuilder<PlayerEvent, PlayerEvent, QSortThenBy> {
  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> thenByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.asc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> thenByCreateAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createAt', Sort.desc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> thenByPlayerEventType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerEventType', Sort.asc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy>
      thenByPlayerEventTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerEventType', Sort.desc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> thenByWithWhom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withWhom', Sort.asc);
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QAfterSortBy> thenByWithWhomDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'withWhom', Sort.desc);
    });
  }
}

extension PlayerEventQueryWhereDistinct
    on QueryBuilder<PlayerEvent, PlayerEvent, QDistinct> {
  QueryBuilder<PlayerEvent, PlayerEvent, QDistinct> distinctByCreateAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createAt');
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QDistinct>
      distinctByPlayerEventType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerEventType');
    });
  }

  QueryBuilder<PlayerEvent, PlayerEvent, QDistinct> distinctByWithWhom(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'withWhom', caseSensitive: caseSensitive);
    });
  }
}

extension PlayerEventQueryProperty
    on QueryBuilder<PlayerEvent, PlayerEvent, QQueryProperty> {
  QueryBuilder<PlayerEvent, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PlayerEvent, int, QQueryOperations> createAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createAt');
    });
  }

  QueryBuilder<PlayerEvent, PlayerEventType, QQueryOperations>
      playerEventTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerEventType');
    });
  }

  QueryBuilder<PlayerEvent, String?, QQueryOperations> withWhomProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'withWhom');
    });
  }
}
