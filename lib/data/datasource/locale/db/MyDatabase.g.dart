// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyDatabase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ChatsEntityData extends DataClass implements Insertable<ChatsEntityData> {
  final String dateTimes;
  final String number;
  final String isoCode;
  final String dialCode;
  ChatsEntityData(
      {required this.dateTimes,
      required this.number,
      required this.isoCode,
      required this.dialCode});
  factory ChatsEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ChatsEntityData(
      dateTimes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_times'])!,
      number: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
      isoCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}iso_code'])!,
      dialCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dial_code'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date_times'] = Variable<String>(dateTimes);
    map['number'] = Variable<String>(number);
    map['iso_code'] = Variable<String>(isoCode);
    map['dial_code'] = Variable<String>(dialCode);
    return map;
  }

  ChatsEntityCompanion toCompanion(bool nullToAbsent) {
    return ChatsEntityCompanion(
      dateTimes: Value(dateTimes),
      number: Value(number),
      isoCode: Value(isoCode),
      dialCode: Value(dialCode),
    );
  }

  factory ChatsEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ChatsEntityData(
      dateTimes: serializer.fromJson<String>(json['dateTimes']),
      number: serializer.fromJson<String>(json['number']),
      isoCode: serializer.fromJson<String>(json['isoCode']),
      dialCode: serializer.fromJson<String>(json['dialCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dateTimes': serializer.toJson<String>(dateTimes),
      'number': serializer.toJson<String>(number),
      'isoCode': serializer.toJson<String>(isoCode),
      'dialCode': serializer.toJson<String>(dialCode),
    };
  }

  ChatsEntityData copyWith(
          {String? dateTimes,
          String? number,
          String? isoCode,
          String? dialCode}) =>
      ChatsEntityData(
        dateTimes: dateTimes ?? this.dateTimes,
        number: number ?? this.number,
        isoCode: isoCode ?? this.isoCode,
        dialCode: dialCode ?? this.dialCode,
      );
  @override
  String toString() {
    return (StringBuffer('ChatsEntityData(')
          ..write('dateTimes: $dateTimes, ')
          ..write('number: $number, ')
          ..write('isoCode: $isoCode, ')
          ..write('dialCode: $dialCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(dateTimes.hashCode,
      $mrjc(number.hashCode, $mrjc(isoCode.hashCode, dialCode.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatsEntityData &&
          other.dateTimes == this.dateTimes &&
          other.number == this.number &&
          other.isoCode == this.isoCode &&
          other.dialCode == this.dialCode);
}

class ChatsEntityCompanion extends UpdateCompanion<ChatsEntityData> {
  final Value<String> dateTimes;
  final Value<String> number;
  final Value<String> isoCode;
  final Value<String> dialCode;
  const ChatsEntityCompanion({
    this.dateTimes = const Value.absent(),
    this.number = const Value.absent(),
    this.isoCode = const Value.absent(),
    this.dialCode = const Value.absent(),
  });
  ChatsEntityCompanion.insert({
    required String dateTimes,
    required String number,
    required String isoCode,
    required String dialCode,
  })  : dateTimes = Value(dateTimes),
        number = Value(number),
        isoCode = Value(isoCode),
        dialCode = Value(dialCode);
  static Insertable<ChatsEntityData> custom({
    Expression<String>? dateTimes,
    Expression<String>? number,
    Expression<String>? isoCode,
    Expression<String>? dialCode,
  }) {
    return RawValuesInsertable({
      if (dateTimes != null) 'date_times': dateTimes,
      if (number != null) 'number': number,
      if (isoCode != null) 'iso_code': isoCode,
      if (dialCode != null) 'dial_code': dialCode,
    });
  }

  ChatsEntityCompanion copyWith(
      {Value<String>? dateTimes,
      Value<String>? number,
      Value<String>? isoCode,
      Value<String>? dialCode}) {
    return ChatsEntityCompanion(
      dateTimes: dateTimes ?? this.dateTimes,
      number: number ?? this.number,
      isoCode: isoCode ?? this.isoCode,
      dialCode: dialCode ?? this.dialCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dateTimes.present) {
      map['date_times'] = Variable<String>(dateTimes.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (isoCode.present) {
      map['iso_code'] = Variable<String>(isoCode.value);
    }
    if (dialCode.present) {
      map['dial_code'] = Variable<String>(dialCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatsEntityCompanion(')
          ..write('dateTimes: $dateTimes, ')
          ..write('number: $number, ')
          ..write('isoCode: $isoCode, ')
          ..write('dialCode: $dialCode')
          ..write(')'))
        .toString();
  }
}

class $ChatsEntityTable extends ChatsEntity
    with TableInfo<$ChatsEntityTable, ChatsEntityData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ChatsEntityTable(this._db, [this._alias]);
  final VerificationMeta _dateTimesMeta = const VerificationMeta('dateTimes');
  @override
  late final GeneratedTextColumn dateTimes = _constructDateTimes();
  GeneratedTextColumn _constructDateTimes() {
    return GeneratedTextColumn(
      'date_times',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedTextColumn number = _constructNumber();
  GeneratedTextColumn _constructNumber() {
    return GeneratedTextColumn(
      'number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isoCodeMeta = const VerificationMeta('isoCode');
  @override
  late final GeneratedTextColumn isoCode = _constructIsoCode();
  GeneratedTextColumn _constructIsoCode() {
    return GeneratedTextColumn(
      'iso_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dialCodeMeta = const VerificationMeta('dialCode');
  @override
  late final GeneratedTextColumn dialCode = _constructDialCode();
  GeneratedTextColumn _constructDialCode() {
    return GeneratedTextColumn(
      'dial_code',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [dateTimes, number, isoCode, dialCode];
  @override
  $ChatsEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chats_entity';
  @override
  final String actualTableName = 'chats_entity';
  @override
  VerificationContext validateIntegrity(Insertable<ChatsEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_times')) {
      context.handle(_dateTimesMeta,
          dateTimes.isAcceptableOrUnknown(data['date_times']!, _dateTimesMeta));
    } else if (isInserting) {
      context.missing(_dateTimesMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('iso_code')) {
      context.handle(_isoCodeMeta,
          isoCode.isAcceptableOrUnknown(data['iso_code']!, _isoCodeMeta));
    } else if (isInserting) {
      context.missing(_isoCodeMeta);
    }
    if (data.containsKey('dial_code')) {
      context.handle(_dialCodeMeta,
          dialCode.isAcceptableOrUnknown(data['dial_code']!, _dialCodeMeta));
    } else if (isInserting) {
      context.missing(_dialCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {number};
  @override
  ChatsEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ChatsEntityData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChatsEntityTable createAlias(String alias) {
    return $ChatsEntityTable(_db, alias);
  }
}

class TemplatesEntityData extends DataClass
    implements Insertable<TemplatesEntityData> {
  final int id;
  final String message;
  final String dateTimes;
  final bool isNewTemplate;
  TemplatesEntityData(
      {required this.id,
      required this.message,
      required this.dateTimes,
      required this.isNewTemplate});
  factory TemplatesEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TemplatesEntityData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      message: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}message'])!,
      dateTimes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_times'])!,
      isNewTemplate: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_new_template'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['message'] = Variable<String>(message);
    map['date_times'] = Variable<String>(dateTimes);
    map['is_new_template'] = Variable<bool>(isNewTemplate);
    return map;
  }

  TemplatesEntityCompanion toCompanion(bool nullToAbsent) {
    return TemplatesEntityCompanion(
      id: Value(id),
      message: Value(message),
      dateTimes: Value(dateTimes),
      isNewTemplate: Value(isNewTemplate),
    );
  }

  factory TemplatesEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TemplatesEntityData(
      id: serializer.fromJson<int>(json['id']),
      message: serializer.fromJson<String>(json['message']),
      dateTimes: serializer.fromJson<String>(json['dateTimes']),
      isNewTemplate: serializer.fromJson<bool>(json['isNewTemplate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'message': serializer.toJson<String>(message),
      'dateTimes': serializer.toJson<String>(dateTimes),
      'isNewTemplate': serializer.toJson<bool>(isNewTemplate),
    };
  }

  TemplatesEntityData copyWith(
          {int? id, String? message, String? dateTimes, bool? isNewTemplate}) =>
      TemplatesEntityData(
        id: id ?? this.id,
        message: message ?? this.message,
        dateTimes: dateTimes ?? this.dateTimes,
        isNewTemplate: isNewTemplate ?? this.isNewTemplate,
      );
  @override
  String toString() {
    return (StringBuffer('TemplatesEntityData(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('dateTimes: $dateTimes, ')
          ..write('isNewTemplate: $isNewTemplate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(message.hashCode,
          $mrjc(dateTimes.hashCode, isNewTemplate.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TemplatesEntityData &&
          other.id == this.id &&
          other.message == this.message &&
          other.dateTimes == this.dateTimes &&
          other.isNewTemplate == this.isNewTemplate);
}

class TemplatesEntityCompanion extends UpdateCompanion<TemplatesEntityData> {
  final Value<int> id;
  final Value<String> message;
  final Value<String> dateTimes;
  final Value<bool> isNewTemplate;
  const TemplatesEntityCompanion({
    this.id = const Value.absent(),
    this.message = const Value.absent(),
    this.dateTimes = const Value.absent(),
    this.isNewTemplate = const Value.absent(),
  });
  TemplatesEntityCompanion.insert({
    this.id = const Value.absent(),
    required String message,
    required String dateTimes,
    required bool isNewTemplate,
  })  : message = Value(message),
        dateTimes = Value(dateTimes),
        isNewTemplate = Value(isNewTemplate);
  static Insertable<TemplatesEntityData> custom({
    Expression<int>? id,
    Expression<String>? message,
    Expression<String>? dateTimes,
    Expression<bool>? isNewTemplate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (message != null) 'message': message,
      if (dateTimes != null) 'date_times': dateTimes,
      if (isNewTemplate != null) 'is_new_template': isNewTemplate,
    });
  }

  TemplatesEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? message,
      Value<String>? dateTimes,
      Value<bool>? isNewTemplate}) {
    return TemplatesEntityCompanion(
      id: id ?? this.id,
      message: message ?? this.message,
      dateTimes: dateTimes ?? this.dateTimes,
      isNewTemplate: isNewTemplate ?? this.isNewTemplate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (dateTimes.present) {
      map['date_times'] = Variable<String>(dateTimes.value);
    }
    if (isNewTemplate.present) {
      map['is_new_template'] = Variable<bool>(isNewTemplate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TemplatesEntityCompanion(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('dateTimes: $dateTimes, ')
          ..write('isNewTemplate: $isNewTemplate')
          ..write(')'))
        .toString();
  }
}

class $TemplatesEntityTable extends TemplatesEntity
    with TableInfo<$TemplatesEntityTable, TemplatesEntityData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TemplatesEntityTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _messageMeta = const VerificationMeta('message');
  @override
  late final GeneratedTextColumn message = _constructMessage();
  GeneratedTextColumn _constructMessage() {
    return GeneratedTextColumn(
      'message',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateTimesMeta = const VerificationMeta('dateTimes');
  @override
  late final GeneratedTextColumn dateTimes = _constructDateTimes();
  GeneratedTextColumn _constructDateTimes() {
    return GeneratedTextColumn(
      'date_times',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isNewTemplateMeta =
      const VerificationMeta('isNewTemplate');
  @override
  late final GeneratedBoolColumn isNewTemplate = _constructIsNewTemplate();
  GeneratedBoolColumn _constructIsNewTemplate() {
    return GeneratedBoolColumn(
      'is_new_template',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, message, dateTimes, isNewTemplate];
  @override
  $TemplatesEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'templates_entity';
  @override
  final String actualTableName = 'templates_entity';
  @override
  VerificationContext validateIntegrity(
      Insertable<TemplatesEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message')) {
      context.handle(_messageMeta,
          message.isAcceptableOrUnknown(data['message']!, _messageMeta));
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('date_times')) {
      context.handle(_dateTimesMeta,
          dateTimes.isAcceptableOrUnknown(data['date_times']!, _dateTimesMeta));
    } else if (isInserting) {
      context.missing(_dateTimesMeta);
    }
    if (data.containsKey('is_new_template')) {
      context.handle(
          _isNewTemplateMeta,
          isNewTemplate.isAcceptableOrUnknown(
              data['is_new_template']!, _isNewTemplateMeta));
    } else if (isInserting) {
      context.missing(_isNewTemplateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TemplatesEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TemplatesEntityData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TemplatesEntityTable createAlias(String alias) {
    return $TemplatesEntityTable(_db, alias);
  }
}

class LinksEntityData extends DataClass implements Insertable<LinksEntityData> {
  final String dateTimes;
  final String number;
  final String isoCode;
  final String dialCode;
  LinksEntityData(
      {required this.dateTimes,
      required this.number,
      required this.isoCode,
      required this.dialCode});
  factory LinksEntityData.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return LinksEntityData(
      dateTimes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_times'])!,
      number: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
      isoCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}iso_code'])!,
      dialCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dial_code'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date_times'] = Variable<String>(dateTimes);
    map['number'] = Variable<String>(number);
    map['iso_code'] = Variable<String>(isoCode);
    map['dial_code'] = Variable<String>(dialCode);
    return map;
  }

  LinksEntityCompanion toCompanion(bool nullToAbsent) {
    return LinksEntityCompanion(
      dateTimes: Value(dateTimes),
      number: Value(number),
      isoCode: Value(isoCode),
      dialCode: Value(dialCode),
    );
  }

  factory LinksEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return LinksEntityData(
      dateTimes: serializer.fromJson<String>(json['dateTimes']),
      number: serializer.fromJson<String>(json['number']),
      isoCode: serializer.fromJson<String>(json['isoCode']),
      dialCode: serializer.fromJson<String>(json['dialCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dateTimes': serializer.toJson<String>(dateTimes),
      'number': serializer.toJson<String>(number),
      'isoCode': serializer.toJson<String>(isoCode),
      'dialCode': serializer.toJson<String>(dialCode),
    };
  }

  LinksEntityData copyWith(
          {String? dateTimes,
          String? number,
          String? isoCode,
          String? dialCode}) =>
      LinksEntityData(
        dateTimes: dateTimes ?? this.dateTimes,
        number: number ?? this.number,
        isoCode: isoCode ?? this.isoCode,
        dialCode: dialCode ?? this.dialCode,
      );
  @override
  String toString() {
    return (StringBuffer('LinksEntityData(')
          ..write('dateTimes: $dateTimes, ')
          ..write('number: $number, ')
          ..write('isoCode: $isoCode, ')
          ..write('dialCode: $dialCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(dateTimes.hashCode,
      $mrjc(number.hashCode, $mrjc(isoCode.hashCode, dialCode.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LinksEntityData &&
          other.dateTimes == this.dateTimes &&
          other.number == this.number &&
          other.isoCode == this.isoCode &&
          other.dialCode == this.dialCode);
}

class LinksEntityCompanion extends UpdateCompanion<LinksEntityData> {
  final Value<String> dateTimes;
  final Value<String> number;
  final Value<String> isoCode;
  final Value<String> dialCode;
  const LinksEntityCompanion({
    this.dateTimes = const Value.absent(),
    this.number = const Value.absent(),
    this.isoCode = const Value.absent(),
    this.dialCode = const Value.absent(),
  });
  LinksEntityCompanion.insert({
    required String dateTimes,
    required String number,
    required String isoCode,
    required String dialCode,
  })  : dateTimes = Value(dateTimes),
        number = Value(number),
        isoCode = Value(isoCode),
        dialCode = Value(dialCode);
  static Insertable<LinksEntityData> custom({
    Expression<String>? dateTimes,
    Expression<String>? number,
    Expression<String>? isoCode,
    Expression<String>? dialCode,
  }) {
    return RawValuesInsertable({
      if (dateTimes != null) 'date_times': dateTimes,
      if (number != null) 'number': number,
      if (isoCode != null) 'iso_code': isoCode,
      if (dialCode != null) 'dial_code': dialCode,
    });
  }

  LinksEntityCompanion copyWith(
      {Value<String>? dateTimes,
      Value<String>? number,
      Value<String>? isoCode,
      Value<String>? dialCode}) {
    return LinksEntityCompanion(
      dateTimes: dateTimes ?? this.dateTimes,
      number: number ?? this.number,
      isoCode: isoCode ?? this.isoCode,
      dialCode: dialCode ?? this.dialCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dateTimes.present) {
      map['date_times'] = Variable<String>(dateTimes.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (isoCode.present) {
      map['iso_code'] = Variable<String>(isoCode.value);
    }
    if (dialCode.present) {
      map['dial_code'] = Variable<String>(dialCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinksEntityCompanion(')
          ..write('dateTimes: $dateTimes, ')
          ..write('number: $number, ')
          ..write('isoCode: $isoCode, ')
          ..write('dialCode: $dialCode')
          ..write(')'))
        .toString();
  }
}

class $LinksEntityTable extends LinksEntity
    with TableInfo<$LinksEntityTable, LinksEntityData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LinksEntityTable(this._db, [this._alias]);
  final VerificationMeta _dateTimesMeta = const VerificationMeta('dateTimes');
  @override
  late final GeneratedTextColumn dateTimes = _constructDateTimes();
  GeneratedTextColumn _constructDateTimes() {
    return GeneratedTextColumn(
      'date_times',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedTextColumn number = _constructNumber();
  GeneratedTextColumn _constructNumber() {
    return GeneratedTextColumn(
      'number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _isoCodeMeta = const VerificationMeta('isoCode');
  @override
  late final GeneratedTextColumn isoCode = _constructIsoCode();
  GeneratedTextColumn _constructIsoCode() {
    return GeneratedTextColumn(
      'iso_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dialCodeMeta = const VerificationMeta('dialCode');
  @override
  late final GeneratedTextColumn dialCode = _constructDialCode();
  GeneratedTextColumn _constructDialCode() {
    return GeneratedTextColumn(
      'dial_code',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [dateTimes, number, isoCode, dialCode];
  @override
  $LinksEntityTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'links_entity';
  @override
  final String actualTableName = 'links_entity';
  @override
  VerificationContext validateIntegrity(Insertable<LinksEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date_times')) {
      context.handle(_dateTimesMeta,
          dateTimes.isAcceptableOrUnknown(data['date_times']!, _dateTimesMeta));
    } else if (isInserting) {
      context.missing(_dateTimesMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('iso_code')) {
      context.handle(_isoCodeMeta,
          isoCode.isAcceptableOrUnknown(data['iso_code']!, _isoCodeMeta));
    } else if (isInserting) {
      context.missing(_isoCodeMeta);
    }
    if (data.containsKey('dial_code')) {
      context.handle(_dialCodeMeta,
          dialCode.isAcceptableOrUnknown(data['dial_code']!, _dialCodeMeta));
    } else if (isInserting) {
      context.missing(_dialCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {number};
  @override
  LinksEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return LinksEntityData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LinksEntityTable createAlias(String alias) {
    return $LinksEntityTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ChatsEntityTable chatsEntity = $ChatsEntityTable(this);
  late final $TemplatesEntityTable templatesEntity =
      $TemplatesEntityTable(this);
  late final $LinksEntityTable linksEntity = $LinksEntityTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [chatsEntity, templatesEntity, linksEntity];
}
