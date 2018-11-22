// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

Serializer<Currency> _$currencySerializer = new _$CurrencySerializer();

class _$CurrencySerializer implements StructuredSerializer<Currency> {
  @override
  final Iterable<Type> types = const [Currency, _$Currency];
  @override
  final String wireName = 'Currency';

  @override
  Iterable serialize(Serializers serializers, Currency object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'numericCode',
      serializers.serialize(object.numericCode,
          specifiedType: const FullType(int)),
      'defaultFractionDigits',
      serializers.serialize(object.defaultFractionDigits,
          specifiedType: const FullType(int)),
      'subUnit',
      serializers.serialize(object.subUnit, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Currency deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CurrencyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'numericCode':
          result.numericCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'defaultFractionDigits':
          result.defaultFractionDigits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'subUnit':
          result.subUnit = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Currency extends Currency {
  @override
  final String code;
  @override
  final String name;
  @override
  final int numericCode;
  @override
  final int defaultFractionDigits;
  @override
  final int subUnit;

  factory _$Currency([void updates(CurrencyBuilder b)]) =>
      (new CurrencyBuilder()..update(updates)).build();

  _$Currency._(
      {this.code,
      this.name,
      this.numericCode,
      this.defaultFractionDigits,
      this.subUnit})
      : super._() {
    if (code == null) {
      throw new BuiltValueNullFieldError('Currency', 'code');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Currency', 'name');
    }
    if (numericCode == null) {
      throw new BuiltValueNullFieldError('Currency', 'numericCode');
    }
    if (defaultFractionDigits == null) {
      throw new BuiltValueNullFieldError('Currency', 'defaultFractionDigits');
    }
    if (subUnit == null) {
      throw new BuiltValueNullFieldError('Currency', 'subUnit');
    }
  }

  @override
  Currency rebuild(void updates(CurrencyBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CurrencyBuilder toBuilder() => new CurrencyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Currency &&
        code == other.code &&
        name == other.name &&
        numericCode == other.numericCode &&
        defaultFractionDigits == other.defaultFractionDigits &&
        subUnit == other.subUnit;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, code.hashCode), name.hashCode),
                numericCode.hashCode),
            defaultFractionDigits.hashCode),
        subUnit.hashCode));
  }
}

class CurrencyBuilder implements Builder<Currency, CurrencyBuilder> {
  _$Currency _$v;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _numericCode;
  int get numericCode => _$this._numericCode;
  set numericCode(int numericCode) => _$this._numericCode = numericCode;

  int _defaultFractionDigits;
  int get defaultFractionDigits => _$this._defaultFractionDigits;
  set defaultFractionDigits(int defaultFractionDigits) =>
      _$this._defaultFractionDigits = defaultFractionDigits;

  int _subUnit;
  int get subUnit => _$this._subUnit;
  set subUnit(int subUnit) => _$this._subUnit = subUnit;

  CurrencyBuilder();

  CurrencyBuilder get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _name = _$v.name;
      _numericCode = _$v.numericCode;
      _defaultFractionDigits = _$v.defaultFractionDigits;
      _subUnit = _$v.subUnit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Currency other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Currency;
  }

  @override
  void update(void updates(CurrencyBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Currency build() {
    final _$result = _$v ??
        new _$Currency._(
            code: code,
            name: name,
            numericCode: numericCode,
            defaultFractionDigits: defaultFractionDigits,
            subUnit: subUnit);
    replace(_$result);
    return _$result;
  }
}
