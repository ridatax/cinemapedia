import 'package:intl/intl.dart';
import 'package:cinemapedia/config/constants/environment.dart';

class HumanFormats {
  static String number(double number, [int decimals = 0]) {
    final formattedNumber =
        NumberFormat.compactCurrency(decimalDigits: decimals, symbol: '', locale: 'en')
            .format(number);

    return formattedNumber;
  }

  static String shortDate(DateTime date) {
    final format = DateFormat.yMMMEd(Environment.LANGUAGUE);
    return format.format(date);
  }
}
