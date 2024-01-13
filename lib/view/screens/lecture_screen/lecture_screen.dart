import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../data/provider/auth_provider.dart';
import '../../../data/services/notifications/notification.dart';
import '../../../res/import/import.dart';

class LectureScreen extends StatefulWidget {
  const LectureScreen({super.key});

  @override
  State<LectureScreen> createState() => _LectureScreenState();
}

class _LectureScreenState extends State<LectureScreen> with Validators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(
      {required BuildContext context, required dynamic value}) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        value = pickedDate.toString();
      });
    }
  }

  Future<void> _selectTime(
      {required BuildContext context, required dynamic value}) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        value = pickedTime.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Consumer<AuthenticationProvider>(
            builder: (context, auth, child) {
              return Padding(
                padding: REdgeInsets.fromLTRB(18, 18, 18, 18),
                child: Column(
                  children: [
                    const YMargin(20),
                    Text(
                      'Add lecture',
                      style: LectureAlertTextStyle.subMedium.copyWith(
                        fontWeight: FontWeight.w500,
                        color: lectureAlertBlack,
                      ),
                    ),
                    const YMargin(20),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Course Name/Code',
                                textAlign: TextAlign.center,
                                style: LectureAlertTextStyle.normal.copyWith(
                                  color: lectureAlertTextColor,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        const YMargin(4),
                        CustomTextFormField(
                          obscureText: false,
                          readonly: false,
                          hintText: 'Enter Course Name/Code',
                          textInputType: TextInputType.text,
                          controller: auth.courseName,
                          validator: (val) => validateEmptyTextField(val),
                        ),
                      ],
                    ),
                    const YMargin(16),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Lecturer',
                                textAlign: TextAlign.center,
                                style: LectureAlertTextStyle.normal.copyWith(
                                  color: lectureAlertTextColor,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        const YMargin(4),
                        CustomTextFormField(
                          obscureText: false,
                          readonly: false,
                          hintText: 'Enter Lecturer',
                          textInputType: TextInputType.text,
                          controller: auth.lecturer,
                          validator: (val) => validateEmptyTextField(val),
                        ),
                      ],
                    ),
                    const YMargin(10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Department',
                                textAlign: TextAlign.center,
                                style: LectureAlertTextStyle.normal.copyWith(
                                  color: lectureAlertTextColor,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        const YMargin(4),
                        CustomTextFormField(
                          obscureText: false,
                          readonly: false,
                          hintText: 'Enter Department',
                          textInputType: TextInputType.text,
                          controller: auth.department,
                          validator: (val) => validateEmptyTextField(val),
                        ),
                      ],
                    ),
                    const YMargin(10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Room',
                                textAlign: TextAlign.center,
                                style: LectureAlertTextStyle.normal.copyWith(
                                  color: lectureAlertTextColor,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        const YMargin(4),
                        CustomTextFormField(
                          obscureText: false,
                          readonly: false,
                          hintText: 'Enter Room',
                          textInputType: TextInputType.text,
                          controller: auth.room,
                          validator: (val) => validateEmptyTextField(val),
                        ),
                      ],
                    ),
                    const YMargin(10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Date',
                                textAlign: TextAlign.center,
                                style: LectureAlertTextStyle.normal.copyWith(
                                  color: lectureAlertTextColor,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        const YMargin(4),
                        GestureDetector(
                          onTap: () {
                            _selectDate(context: context, value: auth.date);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                  color: lectureAlertGrey,
                                  width: 1,
                                )),
                            child: Padding(
                              padding: REdgeInsets.fromLTRB(8.0, 0, 8, 0),
                              child: Row(
                                children: [
                                  Text(
                                      formatSystemDate(selectedDate.toString()),
                                      textAlign: TextAlign.center,
                                      style:
                                          LectureAlertTextStyle.normal.copyWith(
                                        color: lectureAlertTextColor,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const YMargin(10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Time',
                                textAlign: TextAlign.center,
                                style: LectureAlertTextStyle.normal.copyWith(
                                  color: lectureAlertTextColor,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        const YMargin(4),
                        GestureDetector(
                          onTap: () {
                            _selectTime(context: context, value: auth.time);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(
                                  color: lectureAlertGrey,
                                  width: 1,
                                )),
                            child: Padding(
                              padding: REdgeInsets.fromLTRB(8.0, 0, 8, 0),
                              child: Row(
                                children: [
                                  Text(formatTimeOfDay(selectedTime, context),
                                      textAlign: TextAlign.center,
                                      style:
                                          LectureAlertTextStyle.normal.copyWith(
                                        color: lectureAlertTextColor,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const YMargin(40),
                    CustomButton(
                      title: 'Add Lecture',
                      // loadingState: auth.loginBusy || prof.getUserProfileBusy,
                      onPressed: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        final FormState? form = _formKey.currentState;
                        if (form!.validate()) {
                          FlutterLocalNotificationsPlugin
                              flutterLocalNotificationsPlugin =
                              FlutterLocalNotificationsPlugin();
                          flutterLocalNotificationsPlugin
                              .resolvePlatformSpecificImplementation<
                                  AndroidFlutterLocalNotificationsPlugin>()
                              ?.requestNotificationsPermission();
                          auth.addLecture(
                              value: LectureModel(
                                course: auth.courseName.text,
                                lecturer: auth.lecturer.text,
                                department: auth.department.text,
                                room: auth.room.text,
                                date: formatSystemDate(selectedDate.toString()),
                                time: formatTimeOfDay(selectedTime, context),
                              ),
                              onSuccess: () {
                                auth.courseName.clear();
                                auth.lecturer.clear();
                                auth.department.clear();
                                auth.room.clear();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => const MainScreen()),
                                    (route) => false);
                              });
                          debugPrint(
                              'Notification Scheduled for ${formatTimeOfDay(selectedTime, context)}, ${formatSystemDate(selectedDate.toString())}');
                          NotificationService().scheduleNotification(
                            title: '${auth.courseName}',
                            body:
                                'you have ${auth.courseName} scheduled for${formatTimeOfDay(selectedTime, context)}, ${formatSystemDate(selectedDate.toString())}',
                            scheduledNotificationDateTime: DateTime(
                              selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                              selectedTime.hour,
                              selectedTime.minute,
                            )
                          );
                        }
                      },
                    ),
                    const YMargin(16),
                  ],
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
