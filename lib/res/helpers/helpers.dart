import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../import/import.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

formatCurrency(dynamic value) {
  NumberFormat("#,##0.00", "en_US").format(value);
}

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);
  return '${diff.inDays}';
}

void showErrorToast({String? message, int duration = 3}) {
  Get.rawSnackbar(
    message: message?.capitalizeFirst ?? "An error occured! 🙂",
    title: 'Oops!',
    instantInit: true,
    duration: Duration(seconds: duration),
    backgroundColor: Colors.red.withOpacity(.8),
    margin: const EdgeInsets.symmetric(horizontal: 20),
    snackPosition: SnackPosition.TOP,
    borderRadius: 8,
  );
}

void showSuccessToast({String? message}) {
  Get.rawSnackbar(
    message: message?.capitalizeFirst ?? '',
    title: 'Success',
    instantInit: true,
    duration: const Duration(seconds: 4),
    backgroundColor: lectureAlertPrimaryColor.withOpacity(.8),
    margin: const EdgeInsets.symmetric(horizontal: 20),
    snackPosition: SnackPosition.TOP,
    borderRadius: 8,
  );
}

String formatCurrencyValue(num value) {
  String formattedValue = value.toStringAsFixed(2);
  List<String> parts = formattedValue.split('.');

  final RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  parts[0] = parts[0].replaceAllMapped(regex, (Match match) => '${match[1]},');

  return '${parts[0]}.${parts[1]}';
}

String formatSystemDate(String value) {
  // Parse the input date string
  DateTime dateTime = DateTime.parse(value);

  // Format the date
  String formattedDate = DateFormat("MMMM d, y").format(dateTime);

  return formattedDate;
}

String formatTimeOfDay(TimeOfDay timeOfDay, context) {
  final now = DateTime.now();
  final dateTime =
      DateTime(now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  return TimeOfDay.fromDateTime(dateTime).format(context);
}

class ParserService {
  static num parseMoneyToNum(String money) {
    return num.tryParse(money.replaceAll(',', '')) ?? 0;
  }

// static String formatToMoney(num amount,
//     {String? currency,
//     required BuildContext context,
//     compact = true,
//     bool getSymbolFromCurrency = false}) {
//   String? currencyTo = context
//       .read(authProvider)
//       .fetchUserResponse
//       .data
//       .wallet
//       ?.balance
//       ?.currency;
//   MoneyFormatter fmf = MoneyFormatter(
//       amount: amount.toDouble(),
//       settings: MoneyFormatterSettings(
//           thousandSeparator: ',', decimalSeparator: '.'));
//   return '${currencyTo ?? currency}${compact ? fmf.output.compactNonSymbol : fmf.output.nonSymbol}';
// }
}
