import 'package:lecture_alert/res/import/import.dart';

class LectureAlertTextStyle {
  static TextStyle heading = TextStyle(
      fontSize: (30).sp,
      color: lectureAlertTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.lectureAlertFontFamily);

  static TextStyle subHeading = TextStyle(
      fontSize: (24).sp,
      color: lectureAlertTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.lectureAlertFontFamily);
  static TextStyle medium = TextStyle(
      fontSize: (20).sp,
      color: lectureAlertTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.lectureAlertFontFamily);
  static TextStyle subMedium = TextStyle(
      fontSize: (18).sp,
      color: lectureAlertTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.lectureAlertFontFamily);
  static TextStyle normal = TextStyle(
      fontSize: (16).sp,
      color: lectureAlertTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.lectureAlertFontFamily);
  static TextStyle subNormal = TextStyle(
      fontSize: (14).sp,
      color: lectureAlertTextColor,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.lectureAlertFontFamily);
  static TextStyle small = TextStyle(
      fontSize: (12.sp),
      // color: CbColors.cAccentLighten3,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.lectureAlertFontFamily);
  static TextStyle subSmall = TextStyle(
      fontSize: (10.sp),
      // color: CbColors.cAccentLighten3,
      fontStyle: FontStyle.normal,
      fontFamily: StringConstants.lectureAlertFontFamily);
  static TextStyle errorSubText = TextStyle(
      color: kDebugMode ? Colors.red : Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 21.sp);
}
