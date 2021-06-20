import 'package:intl/intl.dart';


class DateUtils {
  /// Formats the date in `yMMMd` format.
  static String shortMonthDayYear(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  /// Formats the date in `MMM` format.
  static String month(DateTime date) {
    return DateFormat.MMM().format(date);
  }

  /// Formats the date in `d` format.
  static String day(DateTime date) {
    return DateFormat.d().format(date);
  }
}