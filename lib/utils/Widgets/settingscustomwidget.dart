import 'package:lecture_alert/res/import/import.dart';

Widget settingsCustomWidget({
  required Widget buttonicon,
  required String buttonname,
}) {
  return Row(
    children: [
      buttonicon,
      const SizedBox(width: 10),
      Text(
        buttonname,
        textAlign: TextAlign.left,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: lectureAlertTextColor,
            fontSize: 16.0),
      ),
    ],
  );
}

Widget settingsCustomWidgetWithText({
  required Widget buttonicon,
  required String buttonname,
  required String buttonsubtext,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buttonicon,
      const SizedBox(width: 10),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              buttonname,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: lectureAlertTextColor,
                  fontSize: 15.0),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            buttonsubtext,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: lectureAlertTextColor,
                fontSize: 11.0),
          ),
        ],
      ),
    ],
  );
}

Widget accountWidget({
  required Widget buttonicon,
  required String widgettitle,
  required String widgetvalue,
  required Function() onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 0, top: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widgettitle,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: lectureAlertBlack,
              fontSize: 16.0),
        ),
        const SizedBox(width: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 145,
              child: Text(
                widgetvalue,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: lectureAlertTextColor,
                    fontSize: 16.0),
              ),
            ),
            GestureDetector(onTap: onTap, child: buttonicon),
          ],
        ),
      ],
    ),
  );
}

Widget accountWidgetWithoutIcon({
  required String widgettitle,
  required String widgetvalue,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 0, top: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widgettitle,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: lectureAlertBlack,
              fontSize: 16.0),
        ),
        Text(
          widgetvalue,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: lectureAlertTextColor,
              fontSize: 16.0),
        ),
      ],
    ),
  );
}
