import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:kyla_home_budget/src/features/core/extentions/date_extention.dart';

void main() {
  group('DateTimeExtension', () {
    test('should return short month name', () {
      final dateTime = DateTime(2022, 1, 15);
      final shortMonthName = DateFormat.MMM().format(dateTime);

      expect(dateTime.shortMonthName, equals(shortMonthName));
    });
  });
}
