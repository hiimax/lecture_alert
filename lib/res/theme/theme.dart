import '../import/import.dart';

class LectureAlerthelper {
  LectureAlerthelper._();

  ///Light Theme
  static ThemeData lightTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: lectureAlertBackgroundColor,
      // backgroundColor: lectureAlertBackgroundColor,
      brightness: Brightness.light,
      primaryColor: lectureAlertPrimaryColor,
      hintColor: lectureAlertWhite,
      canvasColor: Colors.white,
      cardColor: Colors.white,
      dividerColor: Colors.grey,
      focusColor: lectureAlertPrimaryColor,
      hoverColor: Colors.grey[200],
      // errorColor: Colors.red,
      fontFamily: StringConstants.lectureAlertFontFamily,
      appBarTheme: const AppBarTheme(
        color: lectureAlertWhite,
      ),
      iconTheme: const IconThemeData(
        color: lectureAlertBlack,
        size: 24.0,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  ///Dark Theme
  static ThemeData darkTheme() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: lectureAlertBackgroundColor,
      // backgroundColor: lectureAlertBackgroundColor,
      brightness: Brightness.dark,
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: lectureAlertBackgroundColor,
      ),
      fontFamily: StringConstants.lectureAlertFontFamily,
      primaryColor: Colors.blue,
      hintColor: Colors.orange,
      canvasColor: Colors.black,
      cardColor: Colors.black,
      dividerColor: Colors.grey,
      focusColor: Colors.blue,
      hoverColor: Colors.grey[200],
      // errorColor: Colors.red,
      appBarTheme: const AppBarTheme(
        color: lectureAlertBackgroundColor,
      ),
      iconTheme: const IconThemeData(
        color: lectureAlertWhite,
        size: 24.0,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
