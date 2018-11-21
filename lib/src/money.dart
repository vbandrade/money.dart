/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2016 - 2018 Roman Shamritskiy
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

export 'currency.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:money/src/currency.dart';

part 'money.g.dart';

abstract class Money implements Built<Money, MoneyBuilder>, Comparable<Money> {
  int get amount;
  Currency get currency;

  Money._();
  factory Money([updates(MoneyBuilder b)]) = _$Money;
  static Serializer<Money> get serializer => _$moneySerializer;

  /// Parses amount from string representation.
  ///
  /// [FormatException] will be thrown if string representation of amount
  /// is incorrect.
  ///
  /// Examples:
  ///     Money.fromString('120', Currency('USD');
  ///     Money.fromString('120.00', Currency('USD');
  ///     Money.fromString('120.000', Currency('IQD');

  factory Money.fromInt(int amount, Currency currency) {
    return _$Money._(amount: amount, currency: currency);
  }

  factory Money.fromString(String amount, Currency currency) {
    final pattern = r'^(-)?(\d+)(?:\.(\d{' +
        currency.defaultFractionDigits.toString() +
        r'}))?$';
    final match = (RegExp(pattern, multiLine: false)).firstMatch(amount);

    if (match == null) {
      throw FormatException('String representation of amount is invalid.');
    }

    final isNegative = match.group(1) != null;

    final integerPart = int.parse(match.group(2)) * currency.subUnit;

    final fractionPart =
        (match.group(3) != null) ? int.parse(match.group(3)) : 0;

    var intAmount = integerPart + fractionPart;

    if (isNegative) {
      intAmount *= -1;
    }

    return Money.fromInt(intAmount, currency);
  }

  factory Money.fromDouble(double amount, Currency currency) {
    return Money.fromInt((amount * currency.subUnit).round(), currency);
  }

  /// String representation of the [amount].
  String get amountAsString {
    final integerPart = (amount ~/ currency.subUnit).toString();
    final fractionPart = amount.remainder(currency.subUnit).abs().toString();
    final buffer = StringBuffer();

    buffer..write(integerPart)..write('.');

    for (var digits = fractionPart.length;
        digits < currency.defaultFractionDigits;
        digits++) {
      buffer.write('0');
    }

    buffer.write(fractionPart);

    return buffer.toString();
  }

  /// Negate operator.
  Money operator -() {
    return _newMoney(-amount);
  }

  /// Subtraction operator.
  Money operator -(Money other) {
    _assertSameCurrency(other);

    return _newMoney(amount - other.amount);
  }

  /// Addition operator.
  Money operator +(Money other) {
    _assertSameCurrency(other);

    return _newMoney(amount + other.amount);
  }

  /// Multiplication operator.
  Money operator *(num factor) {
    return _newMoney((amount * factor).round());
  }

  /// Allocate the monetary value represented by this Money object
  /// using a list of [ratios].
  List<Money> allocate(List<int> ratios) {
    var total = 0;
    for (var i = 0; i < ratios.length; i++) {
      total += ratios[i];
    }

    var remainder = amount;
    var results = List<Money>(ratios.length);
    for (var i = 0; i < results.length; i++) {
      results[i] = _newMoney(amount * ratios[i] ~/ total);
      remainder -= results[i].amount;
    }

    for (var i = 0; i < remainder; i++) {
      results[i] = _newMoney(results[i].amount + 1);
    }

    return results;
  }

  /// Relational less than operator.
  bool operator <(Money other) {
    _assertSameCurrency(other);

    return amount < other.amount;
  }

  /// Relational less than or equal operator.
  bool operator <=(Money other) {
    _assertSameCurrency(other);

    return amount <= other.amount;
  }

  /// Relational greater than operator.
  bool operator >(Money other) {
    _assertSameCurrency(other);

    return amount > other.amount;
  }

  /// Relational greater than or equal operator.
  bool operator >=(Money other) {
    _assertSameCurrency(other);

    return amount >= other.amount;
  }

  int compareTo(Money other) {
    _assertSameCurrency(other);

    return amount.compareTo(other.amount);
  }

  /// Returns string representation of money.
  /// For example: "1.50 USD".
  String toString() {
    return '${amountAsString} ${currency.code}';
  }

  Money _newMoney(int amount) {
    return Money.fromInt(amount, currency);
  }

  void _assertSameCurrency(Money money) {
    if (money.currency != currency) {
      throw ArgumentError('Money math mismatch. Currencies are different.');
    }
  }
}
