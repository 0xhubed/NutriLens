// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_unit.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMeasurementUnitCollection on Isar {
  IsarCollection<MeasurementUnit> get measurementUnits => this.collection();
}

const MeasurementUnitSchema = CollectionSchema(
  name: r'MeasurementUnit',
  id: -3516309317440046616,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.byte,
      enumMap: _MeasurementUnitcategoryEnumValueMap,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'displayName': PropertySchema(
      id: 2,
      name: r'displayName',
      type: IsarType.string,
    ),
    r'displayText': PropertySchema(
      id: 3,
      name: r'displayText',
      type: IsarType.string,
    ),
    r'gramEquivalent': PropertySchema(
      id: 4,
      name: r'gramEquivalent',
      type: IsarType.double,
    ),
    r'hasGramConversion': PropertySchema(
      id: 5,
      name: r'hasGramConversion',
      type: IsarType.bool,
    ),
    r'hasVolumeConversion': PropertySchema(
      id: 6,
      name: r'hasVolumeConversion',
      type: IsarType.bool,
    ),
    r'isCommon': PropertySchema(
      id: 7,
      name: r'isCommon',
      type: IsarType.bool,
    ),
    r'mlEquivalent': PropertySchema(
      id: 8,
      name: r'mlEquivalent',
      type: IsarType.double,
    ),
    r'shortName': PropertySchema(
      id: 9,
      name: r'shortName',
      type: IsarType.string,
    ),
    r'symbol': PropertySchema(
      id: 10,
      name: r'symbol',
      type: IsarType.string,
    ),
    r'unitId': PropertySchema(
      id: 11,
      name: r'unitId',
      type: IsarType.string,
    )
  },
  estimateSize: _measurementUnitEstimateSize,
  serialize: _measurementUnitSerialize,
  deserialize: _measurementUnitDeserialize,
  deserializeProp: _measurementUnitDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _measurementUnitGetId,
  getLinks: _measurementUnitGetLinks,
  attach: _measurementUnitAttach,
  version: '3.1.0+1',
);

int _measurementUnitEstimateSize(
  MeasurementUnit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.displayName.length * 3;
  bytesCount += 3 + object.displayText.length * 3;
  bytesCount += 3 + object.shortName.length * 3;
  {
    final value = object.symbol;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.unitId.length * 3;
  return bytesCount;
}

void _measurementUnitSerialize(
  MeasurementUnit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.category.index);
  writer.writeString(offsets[1], object.description);
  writer.writeString(offsets[2], object.displayName);
  writer.writeString(offsets[3], object.displayText);
  writer.writeDouble(offsets[4], object.gramEquivalent);
  writer.writeBool(offsets[5], object.hasGramConversion);
  writer.writeBool(offsets[6], object.hasVolumeConversion);
  writer.writeBool(offsets[7], object.isCommon);
  writer.writeDouble(offsets[8], object.mlEquivalent);
  writer.writeString(offsets[9], object.shortName);
  writer.writeString(offsets[10], object.symbol);
  writer.writeString(offsets[11], object.unitId);
}

MeasurementUnit _measurementUnitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MeasurementUnit();
  object.category =
      _MeasurementUnitcategoryValueEnumMap[reader.readByteOrNull(offsets[0])] ??
          MeasurementCategory.liquid;
  object.description = reader.readStringOrNull(offsets[1]);
  object.displayName = reader.readString(offsets[2]);
  object.gramEquivalent = reader.readDoubleOrNull(offsets[4]);
  object.id = id;
  object.isCommon = reader.readBool(offsets[7]);
  object.mlEquivalent = reader.readDoubleOrNull(offsets[8]);
  object.shortName = reader.readString(offsets[9]);
  object.symbol = reader.readStringOrNull(offsets[10]);
  object.unitId = reader.readString(offsets[11]);
  return object;
}

P _measurementUnitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_MeasurementUnitcategoryValueEnumMap[
              reader.readByteOrNull(offset)] ??
          MeasurementCategory.liquid) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MeasurementUnitcategoryEnumValueMap = {
  'liquid': 0,
  'powder': 1,
  'solid': 2,
  'bulk': 3,
  'custom': 4,
};
const _MeasurementUnitcategoryValueEnumMap = {
  0: MeasurementCategory.liquid,
  1: MeasurementCategory.powder,
  2: MeasurementCategory.solid,
  3: MeasurementCategory.bulk,
  4: MeasurementCategory.custom,
};

Id _measurementUnitGetId(MeasurementUnit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _measurementUnitGetLinks(MeasurementUnit object) {
  return [];
}

void _measurementUnitAttach(
    IsarCollection<dynamic> col, Id id, MeasurementUnit object) {
  object.id = id;
}

extension MeasurementUnitQueryWhereSort
    on QueryBuilder<MeasurementUnit, MeasurementUnit, QWhere> {
  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MeasurementUnitQueryWhere
    on QueryBuilder<MeasurementUnit, MeasurementUnit, QWhereClause> {
  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterWhereClause> idBetween(
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

extension MeasurementUnitQueryFilter
    on QueryBuilder<MeasurementUnit, MeasurementUnit, QFilterCondition> {
  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      categoryEqualTo(MeasurementCategory value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      categoryGreaterThan(
    MeasurementCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      categoryLessThan(
    MeasurementCategory value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      categoryBetween(
    MeasurementCategory lower,
    MeasurementCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
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

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
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

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
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

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
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

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
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

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayName',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'displayText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'displayText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'displayText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      displayTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'displayText',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      gramEquivalentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gramEquivalent',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      gramEquivalentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gramEquivalent',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      gramEquivalentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gramEquivalent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      gramEquivalentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gramEquivalent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      gramEquivalentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gramEquivalent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      gramEquivalentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gramEquivalent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      hasGramConversionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasGramConversion',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      hasVolumeConversionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasVolumeConversion',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      isCommonEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCommon',
        value: value,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      mlEquivalentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mlEquivalent',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      mlEquivalentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mlEquivalent',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      mlEquivalentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mlEquivalent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      mlEquivalentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mlEquivalent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      mlEquivalentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mlEquivalent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      mlEquivalentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mlEquivalent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      shortNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      shortNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      shortNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      shortNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shortName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      shortNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      shortNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      shortNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'shortName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      shortNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'shortName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      shortNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortName',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      shortNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'shortName',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'symbol',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'symbol',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      unitIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      unitIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      unitIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      unitIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      unitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      unitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      unitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      unitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      unitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterFilterCondition>
      unitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitId',
        value: '',
      ));
    });
  }
}

extension MeasurementUnitQueryObject
    on QueryBuilder<MeasurementUnit, MeasurementUnit, QFilterCondition> {}

extension MeasurementUnitQueryLinks
    on QueryBuilder<MeasurementUnit, MeasurementUnit, QFilterCondition> {}

extension MeasurementUnitQuerySortBy
    on QueryBuilder<MeasurementUnit, MeasurementUnit, QSortBy> {
  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByDisplayText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayText', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByDisplayTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayText', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByGramEquivalent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramEquivalent', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByGramEquivalentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramEquivalent', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByHasGramConversion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGramConversion', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByHasGramConversionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGramConversion', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByHasVolumeConversion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVolumeConversion', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByHasVolumeConversionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVolumeConversion', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByIsCommon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCommon', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByIsCommonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCommon', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByMlEquivalent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mlEquivalent', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByMlEquivalentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mlEquivalent', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByShortName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortName', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByShortNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortName', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy> sortBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy> sortByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      sortByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }
}

extension MeasurementUnitQuerySortThenBy
    on QueryBuilder<MeasurementUnit, MeasurementUnit, QSortThenBy> {
  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByDisplayName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByDisplayNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayName', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByDisplayText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayText', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByDisplayTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayText', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByGramEquivalent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramEquivalent', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByGramEquivalentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramEquivalent', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByHasGramConversion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGramConversion', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByHasGramConversionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasGramConversion', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByHasVolumeConversion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVolumeConversion', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByHasVolumeConversionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasVolumeConversion', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByIsCommon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCommon', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByIsCommonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCommon', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByMlEquivalent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mlEquivalent', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByMlEquivalentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mlEquivalent', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByShortName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortName', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByShortNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'shortName', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy> thenBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy> thenByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QAfterSortBy>
      thenByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }
}

extension MeasurementUnitQueryWhereDistinct
    on QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct> {
  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct>
      distinctByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category');
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct>
      distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct>
      distinctByDisplayName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct>
      distinctByDisplayText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct>
      distinctByGramEquivalent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gramEquivalent');
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct>
      distinctByHasGramConversion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasGramConversion');
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct>
      distinctByHasVolumeConversion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasVolumeConversion');
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct>
      distinctByIsCommon() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCommon');
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct>
      distinctByMlEquivalent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mlEquivalent');
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct> distinctByShortName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'shortName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct> distinctBySymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'symbol', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementUnit, QDistinct> distinctByUnitId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitId', caseSensitive: caseSensitive);
    });
  }
}

extension MeasurementUnitQueryProperty
    on QueryBuilder<MeasurementUnit, MeasurementUnit, QQueryProperty> {
  QueryBuilder<MeasurementUnit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MeasurementUnit, MeasurementCategory, QQueryOperations>
      categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<MeasurementUnit, String?, QQueryOperations>
      descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<MeasurementUnit, String, QQueryOperations>
      displayNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayName');
    });
  }

  QueryBuilder<MeasurementUnit, String, QQueryOperations>
      displayTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayText');
    });
  }

  QueryBuilder<MeasurementUnit, double?, QQueryOperations>
      gramEquivalentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gramEquivalent');
    });
  }

  QueryBuilder<MeasurementUnit, bool, QQueryOperations>
      hasGramConversionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasGramConversion');
    });
  }

  QueryBuilder<MeasurementUnit, bool, QQueryOperations>
      hasVolumeConversionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasVolumeConversion');
    });
  }

  QueryBuilder<MeasurementUnit, bool, QQueryOperations> isCommonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCommon');
    });
  }

  QueryBuilder<MeasurementUnit, double?, QQueryOperations>
      mlEquivalentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mlEquivalent');
    });
  }

  QueryBuilder<MeasurementUnit, String, QQueryOperations> shortNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'shortName');
    });
  }

  QueryBuilder<MeasurementUnit, String?, QQueryOperations> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symbol');
    });
  }

  QueryBuilder<MeasurementUnit, String, QQueryOperations> unitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitId');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFoodConversionCollection on Isar {
  IsarCollection<FoodConversion> get foodConversions => this.collection();
}

const FoodConversionSchema = CollectionSchema(
  name: r'FoodConversion',
  id: 2549269707963698117,
  properties: {
    r'confidence': PropertySchema(
      id: 0,
      name: r'confidence',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'foodName': PropertySchema(
      id: 2,
      name: r'foodName',
      type: IsarType.string,
    ),
    r'gramsPerUnit': PropertySchema(
      id: 3,
      name: r'gramsPerUnit',
      type: IsarType.double,
    ),
    r'isUserGenerated': PropertySchema(
      id: 4,
      name: r'isUserGenerated',
      type: IsarType.bool,
    ),
    r'source': PropertySchema(
      id: 5,
      name: r'source',
      type: IsarType.string,
    ),
    r'unitId': PropertySchema(
      id: 6,
      name: r'unitId',
      type: IsarType.string,
    ),
    r'usageCount': PropertySchema(
      id: 7,
      name: r'usageCount',
      type: IsarType.long,
    )
  },
  estimateSize: _foodConversionEstimateSize,
  serialize: _foodConversionSerialize,
  deserialize: _foodConversionDeserialize,
  deserializeProp: _foodConversionDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _foodConversionGetId,
  getLinks: _foodConversionGetLinks,
  attach: _foodConversionAttach,
  version: '3.1.0+1',
);

int _foodConversionEstimateSize(
  FoodConversion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.foodName.length * 3;
  {
    final value = object.source;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.unitId.length * 3;
  return bytesCount;
}

void _foodConversionSerialize(
  FoodConversion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.confidence);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.foodName);
  writer.writeDouble(offsets[3], object.gramsPerUnit);
  writer.writeBool(offsets[4], object.isUserGenerated);
  writer.writeString(offsets[5], object.source);
  writer.writeString(offsets[6], object.unitId);
  writer.writeLong(offsets[7], object.usageCount);
}

FoodConversion _foodConversionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodConversion();
  object.confidence = reader.readDouble(offsets[0]);
  object.createdAt = reader.readDateTimeOrNull(offsets[1]);
  object.foodName = reader.readString(offsets[2]);
  object.gramsPerUnit = reader.readDouble(offsets[3]);
  object.id = id;
  object.isUserGenerated = reader.readBool(offsets[4]);
  object.source = reader.readStringOrNull(offsets[5]);
  object.unitId = reader.readString(offsets[6]);
  object.usageCount = reader.readLong(offsets[7]);
  return object;
}

P _foodConversionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDouble(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _foodConversionGetId(FoodConversion object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _foodConversionGetLinks(FoodConversion object) {
  return [];
}

void _foodConversionAttach(
    IsarCollection<dynamic> col, Id id, FoodConversion object) {
  object.id = id;
}

extension FoodConversionQueryWhereSort
    on QueryBuilder<FoodConversion, FoodConversion, QWhere> {
  QueryBuilder<FoodConversion, FoodConversion, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FoodConversionQueryWhere
    on QueryBuilder<FoodConversion, FoodConversion, QWhereClause> {
  QueryBuilder<FoodConversion, FoodConversion, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<FoodConversion, FoodConversion, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterWhereClause> idBetween(
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

extension FoodConversionQueryFilter
    on QueryBuilder<FoodConversion, FoodConversion, QFilterCondition> {
  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      confidenceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      confidenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      confidenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      confidenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confidence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      foodNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      foodNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      foodNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      foodNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      foodNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      foodNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      foodNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      foodNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foodName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      foodNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodName',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      foodNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foodName',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      gramsPerUnitEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gramsPerUnit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      gramsPerUnitGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gramsPerUnit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      gramsPerUnitLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gramsPerUnit',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      gramsPerUnitBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gramsPerUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      isUserGeneratedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUserGenerated',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'source',
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      unitIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      unitIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      unitIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      unitIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      unitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      unitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      unitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      unitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      unitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      unitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      usageCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      usageCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      usageCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterFilterCondition>
      usageCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usageCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FoodConversionQueryObject
    on QueryBuilder<FoodConversion, FoodConversion, QFilterCondition> {}

extension FoodConversionQueryLinks
    on QueryBuilder<FoodConversion, FoodConversion, QFilterCondition> {}

extension FoodConversionQuerySortBy
    on QueryBuilder<FoodConversion, FoodConversion, QSortBy> {
  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy> sortByFoodName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodName', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortByFoodNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodName', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortByGramsPerUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramsPerUnit', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortByGramsPerUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramsPerUnit', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortByIsUserGenerated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserGenerated', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortByIsUserGeneratedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserGenerated', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy> sortByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      sortByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }
}

extension FoodConversionQuerySortThenBy
    on QueryBuilder<FoodConversion, FoodConversion, QSortThenBy> {
  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy> thenByFoodName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodName', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenByFoodNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodName', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenByGramsPerUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramsPerUnit', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenByGramsPerUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gramsPerUnit', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenByIsUserGenerated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserGenerated', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenByIsUserGeneratedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUserGenerated', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy> thenByUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenByUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitId', Sort.desc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QAfterSortBy>
      thenByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }
}

extension FoodConversionQueryWhereDistinct
    on QueryBuilder<FoodConversion, FoodConversion, QDistinct> {
  QueryBuilder<FoodConversion, FoodConversion, QDistinct>
      distinctByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence');
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QDistinct> distinctByFoodName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QDistinct>
      distinctByGramsPerUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gramsPerUnit');
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QDistinct>
      distinctByIsUserGenerated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUserGenerated');
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QDistinct> distinctByUnitId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FoodConversion, FoodConversion, QDistinct>
      distinctByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usageCount');
    });
  }
}

extension FoodConversionQueryProperty
    on QueryBuilder<FoodConversion, FoodConversion, QQueryProperty> {
  QueryBuilder<FoodConversion, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FoodConversion, double, QQueryOperations> confidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence');
    });
  }

  QueryBuilder<FoodConversion, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<FoodConversion, String, QQueryOperations> foodNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodName');
    });
  }

  QueryBuilder<FoodConversion, double, QQueryOperations>
      gramsPerUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gramsPerUnit');
    });
  }

  QueryBuilder<FoodConversion, bool, QQueryOperations>
      isUserGeneratedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUserGenerated');
    });
  }

  QueryBuilder<FoodConversion, String?, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<FoodConversion, String, QQueryOperations> unitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitId');
    });
  }

  QueryBuilder<FoodConversion, int, QQueryOperations> usageCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usageCount');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserMeasurementPreferenceCollection on Isar {
  IsarCollection<UserMeasurementPreference> get userMeasurementPreferences =>
      this.collection();
}

const UserMeasurementPreferenceSchema = CollectionSchema(
  name: r'UserMeasurementPreference',
  id: -3482663735068439475,
  properties: {
    r'foodCategory': PropertySchema(
      id: 0,
      name: r'foodCategory',
      type: IsarType.string,
    ),
    r'lastUsed': PropertySchema(
      id: 1,
      name: r'lastUsed',
      type: IsarType.dateTime,
    ),
    r'preferredUnitId': PropertySchema(
      id: 2,
      name: r'preferredUnitId',
      type: IsarType.string,
    ),
    r'usageCount': PropertySchema(
      id: 3,
      name: r'usageCount',
      type: IsarType.long,
    )
  },
  estimateSize: _userMeasurementPreferenceEstimateSize,
  serialize: _userMeasurementPreferenceSerialize,
  deserialize: _userMeasurementPreferenceDeserialize,
  deserializeProp: _userMeasurementPreferenceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userMeasurementPreferenceGetId,
  getLinks: _userMeasurementPreferenceGetLinks,
  attach: _userMeasurementPreferenceAttach,
  version: '3.1.0+1',
);

int _userMeasurementPreferenceEstimateSize(
  UserMeasurementPreference object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.foodCategory.length * 3;
  bytesCount += 3 + object.preferredUnitId.length * 3;
  return bytesCount;
}

void _userMeasurementPreferenceSerialize(
  UserMeasurementPreference object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.foodCategory);
  writer.writeDateTime(offsets[1], object.lastUsed);
  writer.writeString(offsets[2], object.preferredUnitId);
  writer.writeLong(offsets[3], object.usageCount);
}

UserMeasurementPreference _userMeasurementPreferenceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserMeasurementPreference();
  object.foodCategory = reader.readString(offsets[0]);
  object.id = id;
  object.lastUsed = reader.readDateTime(offsets[1]);
  object.preferredUnitId = reader.readString(offsets[2]);
  object.usageCount = reader.readLong(offsets[3]);
  return object;
}

P _userMeasurementPreferenceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userMeasurementPreferenceGetId(UserMeasurementPreference object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userMeasurementPreferenceGetLinks(
    UserMeasurementPreference object) {
  return [];
}

void _userMeasurementPreferenceAttach(
    IsarCollection<dynamic> col, Id id, UserMeasurementPreference object) {
  object.id = id;
}

extension UserMeasurementPreferenceQueryWhereSort on QueryBuilder<
    UserMeasurementPreference, UserMeasurementPreference, QWhere> {
  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserMeasurementPreferenceQueryWhere on QueryBuilder<
    UserMeasurementPreference, UserMeasurementPreference, QWhereClause> {
  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterWhereClause> idBetween(
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

extension UserMeasurementPreferenceQueryFilter on QueryBuilder<
    UserMeasurementPreference, UserMeasurementPreference, QFilterCondition> {
  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> foodCategoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> foodCategoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> foodCategoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> foodCategoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodCategory',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> foodCategoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foodCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> foodCategoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foodCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
          QAfterFilterCondition>
      foodCategoryContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foodCategory',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
          QAfterFilterCondition>
      foodCategoryMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foodCategory',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> foodCategoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> foodCategoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foodCategory',
        value: '',
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> lastUsedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> lastUsedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> lastUsedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUsed',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> lastUsedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> preferredUnitIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredUnitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> preferredUnitIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'preferredUnitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> preferredUnitIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'preferredUnitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> preferredUnitIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'preferredUnitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> preferredUnitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'preferredUnitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> preferredUnitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'preferredUnitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
          QAfterFilterCondition>
      preferredUnitIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'preferredUnitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
          QAfterFilterCondition>
      preferredUnitIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'preferredUnitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> preferredUnitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'preferredUnitId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> preferredUnitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'preferredUnitId',
        value: '',
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> usageCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> usageCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> usageCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterFilterCondition> usageCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usageCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserMeasurementPreferenceQueryObject on QueryBuilder<
    UserMeasurementPreference, UserMeasurementPreference, QFilterCondition> {}

extension UserMeasurementPreferenceQueryLinks on QueryBuilder<
    UserMeasurementPreference, UserMeasurementPreference, QFilterCondition> {}

extension UserMeasurementPreferenceQuerySortBy on QueryBuilder<
    UserMeasurementPreference, UserMeasurementPreference, QSortBy> {
  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> sortByFoodCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodCategory', Sort.asc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> sortByFoodCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodCategory', Sort.desc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> sortByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> sortByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> sortByPreferredUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredUnitId', Sort.asc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> sortByPreferredUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredUnitId', Sort.desc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> sortByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> sortByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }
}

extension UserMeasurementPreferenceQuerySortThenBy on QueryBuilder<
    UserMeasurementPreference, UserMeasurementPreference, QSortThenBy> {
  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> thenByFoodCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodCategory', Sort.asc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> thenByFoodCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'foodCategory', Sort.desc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> thenByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.asc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> thenByLastUsedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUsed', Sort.desc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> thenByPreferredUnitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredUnitId', Sort.asc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> thenByPreferredUnitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'preferredUnitId', Sort.desc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> thenByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.asc);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference,
      QAfterSortBy> thenByUsageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usageCount', Sort.desc);
    });
  }
}

extension UserMeasurementPreferenceQueryWhereDistinct on QueryBuilder<
    UserMeasurementPreference, UserMeasurementPreference, QDistinct> {
  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference, QDistinct>
      distinctByFoodCategory({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'foodCategory', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference, QDistinct>
      distinctByLastUsed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUsed');
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference, QDistinct>
      distinctByPreferredUnitId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'preferredUnitId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserMeasurementPreference, UserMeasurementPreference, QDistinct>
      distinctByUsageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usageCount');
    });
  }
}

extension UserMeasurementPreferenceQueryProperty on QueryBuilder<
    UserMeasurementPreference, UserMeasurementPreference, QQueryProperty> {
  QueryBuilder<UserMeasurementPreference, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserMeasurementPreference, String, QQueryOperations>
      foodCategoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'foodCategory');
    });
  }

  QueryBuilder<UserMeasurementPreference, DateTime, QQueryOperations>
      lastUsedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUsed');
    });
  }

  QueryBuilder<UserMeasurementPreference, String, QQueryOperations>
      preferredUnitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'preferredUnitId');
    });
  }

  QueryBuilder<UserMeasurementPreference, int, QQueryOperations>
      usageCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usageCount');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FoodPortionSchema = Schema(
  name: r'FoodPortion',
  id: 4019808958201785894,
  properties: {
    r'calories': PropertySchema(
      id: 0,
      name: r'calories',
      type: IsarType.double,
    ),
    r'carbs': PropertySchema(
      id: 1,
      name: r'carbs',
      type: IsarType.double,
    ),
    r'effectiveGrams': PropertySchema(
      id: 2,
      name: r'effectiveGrams',
      type: IsarType.double,
    ),
    r'estimatedGrams': PropertySchema(
      id: 3,
      name: r'estimatedGrams',
      type: IsarType.double,
    ),
    r'fat': PropertySchema(
      id: 4,
      name: r'fat',
      type: IsarType.double,
    ),
    r'foodName': PropertySchema(
      id: 5,
      name: r'foodName',
      type: IsarType.string,
    ),
    r'formattedQuantity': PropertySchema(
      id: 6,
      name: r'formattedQuantity',
      type: IsarType.string,
    ),
    r'formattedWithWeight': PropertySchema(
      id: 7,
      name: r'formattedWithWeight',
      type: IsarType.string,
    ),
    r'notes': PropertySchema(
      id: 8,
      name: r'notes',
      type: IsarType.string,
    ),
    r'protein': PropertySchema(
      id: 9,
      name: r'protein',
      type: IsarType.double,
    ),
    r'quantity': PropertySchema(
      id: 10,
      name: r'quantity',
      type: IsarType.double,
    ),
    r'unitDisplayName': PropertySchema(
      id: 11,
      name: r'unitDisplayName',
      type: IsarType.string,
    ),
    r'unitId': PropertySchema(
      id: 12,
      name: r'unitId',
      type: IsarType.string,
    ),
    r'userCorrectedGrams': PropertySchema(
      id: 13,
      name: r'userCorrectedGrams',
      type: IsarType.double,
    )
  },
  estimateSize: _foodPortionEstimateSize,
  serialize: _foodPortionSerialize,
  deserialize: _foodPortionDeserialize,
  deserializeProp: _foodPortionDeserializeProp,
);

int _foodPortionEstimateSize(
  FoodPortion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.foodName.length * 3;
  bytesCount += 3 + object.formattedQuantity.length * 3;
  bytesCount += 3 + object.formattedWithWeight.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.unitDisplayName.length * 3;
  bytesCount += 3 + object.unitId.length * 3;
  return bytesCount;
}

void _foodPortionSerialize(
  FoodPortion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.calories);
  writer.writeDouble(offsets[1], object.carbs);
  writer.writeDouble(offsets[2], object.effectiveGrams);
  writer.writeDouble(offsets[3], object.estimatedGrams);
  writer.writeDouble(offsets[4], object.fat);
  writer.writeString(offsets[5], object.foodName);
  writer.writeString(offsets[6], object.formattedQuantity);
  writer.writeString(offsets[7], object.formattedWithWeight);
  writer.writeString(offsets[8], object.notes);
  writer.writeDouble(offsets[9], object.protein);
  writer.writeDouble(offsets[10], object.quantity);
  writer.writeString(offsets[11], object.unitDisplayName);
  writer.writeString(offsets[12], object.unitId);
  writer.writeDouble(offsets[13], object.userCorrectedGrams);
}

FoodPortion _foodPortionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FoodPortion();
  object.calories = reader.readDouble(offsets[0]);
  object.carbs = reader.readDouble(offsets[1]);
  object.estimatedGrams = reader.readDoubleOrNull(offsets[3]);
  object.fat = reader.readDouble(offsets[4]);
  object.foodName = reader.readString(offsets[5]);
  object.notes = reader.readStringOrNull(offsets[8]);
  object.protein = reader.readDouble(offsets[9]);
  object.quantity = reader.readDouble(offsets[10]);
  object.unitDisplayName = reader.readString(offsets[11]);
  object.unitId = reader.readString(offsets[12]);
  object.userCorrectedGrams = reader.readDoubleOrNull(offsets[13]);
  return object;
}

P _foodPortionDeserializeProp<P>(
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
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FoodPortionQueryFilter
    on QueryBuilder<FoodPortion, FoodPortion, QFilterCondition> {
  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> caloriesEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      caloriesGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      caloriesLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> caloriesBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> carbsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      carbsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> carbsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carbs',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> carbsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carbs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      effectiveGramsEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'effectiveGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      effectiveGramsGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'effectiveGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      effectiveGramsLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'effectiveGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      effectiveGramsBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'effectiveGrams',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      estimatedGramsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimatedGrams',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      estimatedGramsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimatedGrams',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      estimatedGramsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimatedGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      estimatedGramsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimatedGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      estimatedGramsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimatedGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      estimatedGramsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimatedGrams',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> fatEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> fatGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> fatLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> fatBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> foodNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      foodNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      foodNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> foodNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'foodName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      foodNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      foodNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      foodNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'foodName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> foodNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'foodName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      foodNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'foodName',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      foodNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'foodName',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedQuantityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedQuantityGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedQuantityLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedQuantityBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedQuantityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedQuantityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedQuantityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedQuantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedQuantityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedQuantity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedQuantityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedQuantity',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedQuantityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedQuantity',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedWithWeightEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedWithWeight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedWithWeightGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'formattedWithWeight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedWithWeightLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'formattedWithWeight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedWithWeightBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'formattedWithWeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedWithWeightStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'formattedWithWeight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedWithWeightEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'formattedWithWeight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedWithWeightContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'formattedWithWeight',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedWithWeightMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'formattedWithWeight',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedWithWeightIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'formattedWithWeight',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      formattedWithWeightIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'formattedWithWeight',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> notesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> notesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> proteinEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      proteinGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> proteinLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'protein',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> proteinBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'protein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> quantityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      quantityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      quantityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> quantityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitDisplayNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitDisplayNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitDisplayNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitDisplayNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitDisplayName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitDisplayNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitDisplayNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitDisplayNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitDisplayName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitDisplayNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitDisplayName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitDisplayNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitDisplayName',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitDisplayNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitDisplayName',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> unitIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> unitIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> unitIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> unitIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> unitIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition> unitIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      unitIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitId',
        value: '',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      userCorrectedGramsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userCorrectedGrams',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      userCorrectedGramsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userCorrectedGrams',
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      userCorrectedGramsEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userCorrectedGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      userCorrectedGramsGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userCorrectedGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      userCorrectedGramsLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userCorrectedGrams',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FoodPortion, FoodPortion, QAfterFilterCondition>
      userCorrectedGramsBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userCorrectedGrams',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension FoodPortionQueryObject
    on QueryBuilder<FoodPortion, FoodPortion, QFilterCondition> {}
