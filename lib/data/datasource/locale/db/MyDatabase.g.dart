// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyDatabase.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Chat extends DataClass implements Insertable<Chat> {
  final String countryFlagUri;
  final String countryName;
  final String countryCode;
  final String countryDialCode;
  final String dateTimes;
  final String number;
  final String fullNumber;
  Chat(
      {required this.countryFlagUri,
      required this.countryName,
      required this.countryCode,
      required this.countryDialCode,
      required this.dateTimes,
      required this.number,
      required this.fullNumber});
  factory Chat.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Chat(
      countryFlagUri: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_flag_uri'])!,
      countryName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_name'])!,
      countryCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}country_code'])!,
      countryDialCode: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}country_dial_code'])!,
      dateTimes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date_times'])!,
      number: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
      fullNumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}full_number'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['country_flag_uri'] = Variable<String>(countryFlagUri);
    map['country_name'] = Variable<String>(countryName);
    map['country_code'] = Variable<String>(countryCode);
    map['country_dial_code'] = Variable<String>(countryDialCode);
    map['date_times'] = Variable<String>(dateTimes);
    map['number'] = Variable<String>(number);
    map['full_number'] = Variable<String>(fullNumber);
    return map;
  }

  ChatsCompanion toCompanion(bool nullToAbsent) {
    return ChatsCompanion(
      countryFlagUri: Value(countryFlagUri),
      countryName: Value(countryName),
      countryCode: Value(countryCode),
      countryDialCode: Value(countryDialCode),
      dateTimes: Value(dateTimes),
      number: Value(number),
      fullNumber: Value(fullNumber),
    );
  }

  factory Chat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Chat(
      countryFlagUri: serializer.fromJson<String>(json['countryFlagUri']),
      countryName: serializer.fromJson<String>(json['countryName']),
      countryCode: serializer.fromJson<String>(json['countryCode']),
      countryDialCode: serializer.fromJson<String>(json['countryDialCode']),
      dateTimes: serializer.fromJson<String>(json['dateTimes']),
      number: serializer.fromJson<String>(json['number']),
      fullNumber: serializer.fromJson<String>(json['fullNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'countryFlagUri': serializer.toJson<String>(countryFlagUri),
      'countryName': serializer.toJson<String>(countryName),
      'countryCode': serializer.toJson<String>(countryCode),
      'countryDialCode': serializer.toJson<String>(countryDialCode),
      'dateTimes': serializer.toJson<String>(dateTimes),
      'number': serializer.toJson<String>(number),
      'fullNumber': serializer.toJson<String>(fullNumber),
    };
  }

  Chat copyWith(
          {String? countryFlagUri,
          String? countryName,
          String? countryCode,
          String? countryDialCode,
          String? dateTimes,
          String? number,
          String? fullNumber}) =>
      Chat(
        countryFlagUri: countryFlagUri ?? this.countryFlagUri,
        countryName: countryName ?? this.countryName,
        countryCode: countryCode ?? this.countryCode,
        countryDialCode: countryDialCode ?? this.countryDialCode,
        dateTimes: dateTimes ?? this.dateTimes,
        number: number ?? this.number,
        fullNumber: fullNumber ?? this.fullNumber,
      );
  @override
  String toString() {
    return (StringBuffer('Chat(')
          ..write('countryFlagUri: $countryFlagUri, ')
          ..write('countryName: $countryName, ')
          ..write('countryCode: $countryCode, ')
          ..write('countryDialCode: $countryDialCode, ')
          ..write('dateTimes: $dateTimes, ')
          ..write('number: $number, ')
          ..write('fullNumber: $fullNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      countryFlagUri.hashCode,
      $mrjc(
          countryName.hashCode,
          $mrjc(
              countryCode.hashCode,
              $mrjc(
                  countryDialCode.hashCode,
                  $mrjc(dateTimes.hashCode,
                      $mrjc(number.hashCode, fullNumber.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chat &&
          other.countryFlagUri == this.countryFlagUri &&
          other.countryName == this.countryName &&
          other.countryCode == this.countryCode &&
          other.countryDialCode == this.countryDialCode &&
          other.dateTimes == this.dateTimes &&
          other.number == this.number &&
          other.fullNumber == this.fullNumber);
}

class ChatsCompanion extends UpdateCompanion<Chat> {
  final Value<String> countryFlagUri;
  final Value<String> countryName;
  final Value<String> countryCode;
  final Value<String> countryDialCode;
  final Value<String> dateTimes;
  final Value<String> number;
  final Value<String> fullNumber;
  const ChatsCompanion({
    this.countryFlagUri = const Value.absent(),
    this.countryName = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.countryDialCode = const Value.absent(),
    this.dateTimes = const Value.absent(),
    this.number = const Value.absent(),
    this.fullNumber = const Value.absent(),
  });
  ChatsCompanion.insert({
    required String countryFlagUri,
    required String countryName,
    required String countryCode,
    required String countryDialCode,
    required String dateTimes,
    required String number,
    required String fullNumber,
  })  : countryFlagUri = Value(countryFlagUri),
        countryName = Value(countryName),
        countryCode = Value(countryCode),
        countryDialCode = Value(countryDialCode),
        dateTimes = Value(dateTimes),
        number = Value(number),
        fullNumber = Value(fullNumber);
  static Insertable<Chat> custom({
    Expression<String>? countryFlagUri,
    Expression<String>? countryName,
    Expression<String>? countryCode,
    Expression<String>? countryDialCode,
    Expression<String>? dateTimes,
    Expression<String>? number,
    Expression<String>? fullNumber,
  }) {
    return RawValuesInsertable({
      if (countryFlagUri != null) 'country_flag_uri': countryFlagUri,
      if (countryName != null) 'country_name': countryName,
      if (countryCode != null) 'country_code': countryCode,
      if (countryDialCode != null) 'country_dial_code': countryDialCode,
      if (dateTimes != null) 'date_times': dateTimes,
      if (number != null) 'number': number,
      if (fullNumber != null) 'full_number': fullNumber,
    });
  }

  ChatsCompanion copyWith(
      {Value<String>? countryFlagUri,
      Value<String>? countryName,
      Value<String>? countryCode,
      Value<String>? countryDialCode,
      Value<String>? dateTimes,
      Value<String>? number,
      Value<String>? fullNumber}) {
    return ChatsCompanion(
      countryFlagUri: countryFlagUri ?? this.countryFlagUri,
      countryName: countryName ?? this.countryName,
      countryCode: countryCode ?? this.countryCode,
      countryDialCode: countryDialCode ?? this.countryDialCode,
      dateTimes: dateTimes ?? this.dateTimes,
      number: number ?? this.number,
      fullNumber: fullNumber ?? this.fullNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (countryFlagUri.present) {
      map['country_flag_uri'] = Variable<String>(countryFlagUri.value);
    }
    if (countryName.present) {
      map['country_name'] = Variable<String>(countryName.value);
    }
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    if (countryDialCode.present) {
      map['country_dial_code'] = Variable<String>(countryDialCode.value);
    }
    if (dateTimes.present) {
      map['date_times'] = Variable<String>(dateTimes.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (fullNumber.present) {
      map['full_number'] = Variable<String>(fullNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatsCompanion(')
          ..write('countryFlagUri: $countryFlagUri, ')
          ..write('countryName: $countryName, ')
          ..write('countryCode: $countryCode, ')
          ..write('countryDialCode: $countryDialCode, ')
          ..write('dateTimes: $dateTimes, ')
          ..write('number: $number, ')
          ..write('fullNumber: $fullNumber')
          ..write(')'))
        .toString();
  }
}

class $ChatsTable extends Chats with TableInfo<$ChatsTable, Chat> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ChatsTable(this._db, [this._alias]);
  final VerificationMeta _countryFlagUriMeta =
      const VerificationMeta('countryFlagUri');
  @override
  late final GeneratedTextColumn countryFlagUri = _constructCountryFlagUri();
  GeneratedTextColumn _constructCountryFlagUri() {
    return GeneratedTextColumn(
      'country_flag_uri',
      $tableName,
      false,
    );
  }

  final VerificationMeta _countryNameMeta =
      const VerificationMeta('countryName');
  @override
  late final GeneratedTextColumn countryName = _constructCountryName();
  GeneratedTextColumn _constructCountryName() {
    return GeneratedTextColumn(
      'country_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _countryCodeMeta =
      const VerificationMeta('countryCode');
  @override
  late final GeneratedTextColumn countryCode = _constructCountryCode();
  GeneratedTextColumn _constructCountryCode() {
    return GeneratedTextColumn(
      'country_code',
      $tableName,
      false,
    );
  }

  final VerificationMeta _countryDialCodeMeta =
      const VerificationMeta('countryDialCode');
  @override
  late final GeneratedTextColumn countryDialCode = _constructCountryDialCode();
  GeneratedTextColumn _constructCountryDialCode() {
    return GeneratedTextColumn(
      'country_dial_code',
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

  final VerificationMeta _fullNumberMeta = const VerificationMeta('fullNumber');
  @override
  late final GeneratedTextColumn fullNumber = _constructFullNumber();
  GeneratedTextColumn _constructFullNumber() {
    return GeneratedTextColumn(
      'full_number',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        countryFlagUri,
        countryName,
        countryCode,
        countryDialCode,
        dateTimes,
        number,
        fullNumber
      ];
  @override
  $ChatsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'chats';
  @override
  final String actualTableName = 'chats';
  @override
  VerificationContext validateIntegrity(Insertable<Chat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('country_flag_uri')) {
      context.handle(
          _countryFlagUriMeta,
          countryFlagUri.isAcceptableOrUnknown(
              data['country_flag_uri']!, _countryFlagUriMeta));
    } else if (isInserting) {
      context.missing(_countryFlagUriMeta);
    }
    if (data.containsKey('country_name')) {
      context.handle(
          _countryNameMeta,
          countryName.isAcceptableOrUnknown(
              data['country_name']!, _countryNameMeta));
    } else if (isInserting) {
      context.missing(_countryNameMeta);
    }
    if (data.containsKey('country_code')) {
      context.handle(
          _countryCodeMeta,
          countryCode.isAcceptableOrUnknown(
              data['country_code']!, _countryCodeMeta));
    } else if (isInserting) {
      context.missing(_countryCodeMeta);
    }
    if (data.containsKey('country_dial_code')) {
      context.handle(
          _countryDialCodeMeta,
          countryDialCode.isAcceptableOrUnknown(
              data['country_dial_code']!, _countryDialCodeMeta));
    } else if (isInserting) {
      context.missing(_countryDialCodeMeta);
    }
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
    if (data.containsKey('full_number')) {
      context.handle(
          _fullNumberMeta,
          fullNumber.isAcceptableOrUnknown(
              data['full_number']!, _fullNumberMeta));
    } else if (isInserting) {
      context.missing(_fullNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {fullNumber};
  @override
  Chat map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Chat.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ChatsTable createAlias(String alias) {
    return $ChatsTable(_db, alias);
  }
}

class Template extends DataClass implements Insertable<Template> {
  final int id;
  final String message;
  final String dateTimes;
  final bool isNewTemplate;
  Template(
      {required this.id,
      required this.message,
      required this.dateTimes,
      required this.isNewTemplate});
  factory Template.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Template(
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

  TemplatesCompanion toCompanion(bool nullToAbsent) {
    return TemplatesCompanion(
      id: Value(id),
      message: Value(message),
      dateTimes: Value(dateTimes),
      isNewTemplate: Value(isNewTemplate),
    );
  }

  factory Template.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Template(
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

  Template copyWith(
          {int? id, String? message, String? dateTimes, bool? isNewTemplate}) =>
      Template(
        id: id ?? this.id,
        message: message ?? this.message,
        dateTimes: dateTimes ?? this.dateTimes,
        isNewTemplate: isNewTemplate ?? this.isNewTemplate,
      );
  @override
  String toString() {
    return (StringBuffer('Template(')
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
      (other is Template &&
          other.id == this.id &&
          other.message == this.message &&
          other.dateTimes == this.dateTimes &&
          other.isNewTemplate == this.isNewTemplate);
}

class TemplatesCompanion extends UpdateCompanion<Template> {
  final Value<int> id;
  final Value<String> message;
  final Value<String> dateTimes;
  final Value<bool> isNewTemplate;
  const TemplatesCompanion({
    this.id = const Value.absent(),
    this.message = const Value.absent(),
    this.dateTimes = const Value.absent(),
    this.isNewTemplate = const Value.absent(),
  });
  TemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String message,
    required String dateTimes,
    required bool isNewTemplate,
  })  : message = Value(message),
        dateTimes = Value(dateTimes),
        isNewTemplate = Value(isNewTemplate);
  static Insertable<Template> custom({
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

  TemplatesCompanion copyWith(
      {Value<int>? id,
      Value<String>? message,
      Value<String>? dateTimes,
      Value<bool>? isNewTemplate}) {
    return TemplatesCompanion(
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
    return (StringBuffer('TemplatesCompanion(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('dateTimes: $dateTimes, ')
          ..write('isNewTemplate: $isNewTemplate')
          ..write(')'))
        .toString();
  }
}

class $TemplatesTable extends Templates
    with TableInfo<$TemplatesTable, Template> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TemplatesTable(this._db, [this._alias]);
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
  $TemplatesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'templates';
  @override
  final String actualTableName = 'templates';
  @override
  VerificationContext validateIntegrity(Insertable<Template> instance,
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
  Template map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Template.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TemplatesTable createAlias(String alias) {
    return $TemplatesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ChatsTable chats = $ChatsTable(this);
  late final $TemplatesTable templates = $TemplatesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [chats, templates];
}
