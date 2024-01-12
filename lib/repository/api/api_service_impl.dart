import 'package:get/get.dart';

import '../../res/import/import.dart';

// extension StringExtension on String {
//   String capitalize() {
//     return "${this[0].toUpperCase()}${this.substring(1)}";
//   }
// }

/// Helper service that abstracts away common HTTP Requests
class ApiServiceImpl implements ApiService {
  @override
  Future handlingError({e, String? title}) async {
    if (e.toString().startsWith('{')) {
      var errMap = e.data as Map;
      List<String> errors = [];
      errMap.forEach((key, value) {
        if (value is List) {
          errors.add("${key.toString()}: ${value[0]}");
        } else {
          errors.add("${key.toString()}: $value");
        }
      });
      String finalStr = errors.reduce((value, element) {
        return value + element;
      });

      showErrorToast(
          duration: 20,
          message: "\n${finalStr.replaceAll('_', ' ').capitalizeFirst ?? ''}");
    } else {
      showErrorToast(duration: 3, message: "${title ?? "Failed"}\n $e");
    }
  }
}
