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
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'currencies.dart';

part 'currency.g.dart';

/// Currency Value Object.
abstract class Currency implements Built<Currency, CurrencyBuilder> {
  Currency._();
  factory Currency([updates(CurrencyBuilder b)]) = _$Currency;
  static Serializer<Currency> get serializer => _$currencySerializer;

  /// The ISO 4217 currency code of this currency.
  String get code;

  /// The name that is suitable for displaying this currency.
  String get name;

  /// The ISO 4217 numeric code of this currency.
  int get numericCode;

  /// The default number of fraction digits used with this currency.
  int get defaultFractionDigits;
  int get subUnit;

  /// Constructs currency by ISO 4217 code.
  ///
  /// It throws [ArgumentError] if [code] is unregistered ISO code of currency.
  factory Currency.fromCode(String code) {
    if (code == null || !currencies.containsKey(code.toUpperCase())) {
      throw ArgumentError.value(code, 'code', 'Unknown currency code "$code".');
    }

    return currencies[code.toUpperCase()];
  }

  /// Returns the ISO 4217 currency code of this currency.
  @override
  String toString() => code;
}
