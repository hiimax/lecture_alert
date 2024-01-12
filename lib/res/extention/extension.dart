// ignore: import_of_legacy_library_into_null_safe

extension StringExtension on String {
  /// this is for mobile
  String get mobilesvg => 'assets/images/mobile/svgs/$this.svg';

  String get mobilepng => 'assets/images/mobile/$this.png';

  String get mobilegif => 'assets/images/mobile/$this.gif';

  /// this is for web
  String get websvg => 'assets/images/web/svgs/$this.svg';

  String get webpng => 'assets/images/web/$this.png';

  String get webgif => 'assets/images/web/$this.gif';

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
