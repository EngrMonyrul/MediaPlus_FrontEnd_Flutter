const digitCount = 2;

extension NumX on num {
  String fixedString({int totalDigit = digitCount}) =>
      toStringAsFixed(totalDigit);
}
