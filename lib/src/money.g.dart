// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.dart';

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

Serializer<Money> _$moneySerializer = new _$MoneySerializer();

class _$MoneySerializer implements StructuredSerializer<Money> {
  @override
  final Iterable<Type> types = const [Money, _$Money];
  @override
  final String wireName = 'Money';

  @override
  Iterable serialize(Serializers serializers, Money object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'amount',
      serializers.serialize(object.amount, specifiedType: const FullType(int)),
      'currency',
      serializers.serialize(object.currency,
          specifiedType: const FullType(Currency)),
    ];

    return result;
  }

  @override
  Money deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MoneyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'currency':
          result.currency.replace(serializers.deserialize(value,
              specifiedType: const FullType(Currency)) as Currency);
          break;
      }
    }

    return result.build();
  }
}

class _$Money extends Money {
  @override
  final int amount;
  @override
  final Currency currency;

  factory _$Money([void updates(MoneyBuilder b)]) =>
      (new MoneyBuilder()..update(updates)).build();

  _$Money._({this.amount, this.currency}) : super._() {
    if (amount == null) {
      throw new BuiltValueNullFieldError('Money', 'amount');
    }
    if (currency == null) {
      throw new BuiltValueNullFieldError('Money', 'currency');
    }
  }

  @override
  Money rebuild(void updates(MoneyBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MoneyBuilder toBuilder() => new MoneyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Money &&
        amount == other.amount &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, amount.hashCode), currency.hashCode));
  }
}

class MoneyBuilder implements Builder<Money, MoneyBuilder> {
  _$Money _$v;

  int _amount;
  int get amount => _$this._amount;
  set amount(int amount) => _$this._amount = amount;

  CurrencyBuilder _currency;
  CurrencyBuilder get currency => _$this._currency ??= new CurrencyBuilder();
  set currency(CurrencyBuilder currency) => _$this._currency = currency;

  MoneyBuilder();

  MoneyBuilder get _$this {
    if (_$v != null) {
      _amount = _$v.amount;
      _currency = _$v.currency?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Money other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Money;
  }

  @override
  void update(void updates(MoneyBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Money build() {
    _$Money _$result;
    try {
      _$result =
          _$v ?? new _$Money._(amount: amount, currency: currency.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'currency';
        currency.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Money', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}
