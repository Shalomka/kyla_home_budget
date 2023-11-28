import 'package:intl/intl.dart';

// Extention on DateTime class
extension DateTimeExtention on DateTime {
  // returns short month name
  String get shortMonthName {
    return DateFormat.MMM().format(this);
  }
}
