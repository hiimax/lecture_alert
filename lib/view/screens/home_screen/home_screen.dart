import 'package:lecture_alert/data/provider/auth_provider.dart';

import '../../../res/import/import.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });
    super.initState();
  }

  void loadData() {
    final auth = Provider.of<AuthenticationProvider>(context, listen: false);
    auth.loadLectures();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.fromLTRB(18, 18, 18, 18),
        child: Consumer<AuthenticationProvider>(
          builder: (context, auth, child) {
            return Column(
              children: [
                const YMargin(40),
                Row(
                  children: [
                    Text('Available lectures',
                        textAlign: TextAlign.center,
                        style: LectureAlertTextStyle.subHeading.copyWith(
                          color: lectureAlertTextColor,
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                const YMargin(10),
                auth.lectures.isNotEmpty
                    ? Flexible(
                        child: ListView.separated(
                            cacheExtent: 100,
                            itemBuilder: (ctx, index) {
                              final _value = auth.lectures[index];
                              return Padding(
                                padding: REdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: lectureAlertBlack,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                            color: lectureAlertBlack
                                                .withOpacity(0.5),
                                            offset: const Offset(3, 3),
                                            blurRadius: 8,
                                            spreadRadius: 0)
                                      ]),
                                  child: Padding(
                                    padding:
                                        REdgeInsets.fromLTRB(18, 18, 18, 18),
                                    child: Column(
                                      children: [
                                        const Icon(
                                          Icons.notification_important,
                                          color: lectureAlertWhite,
                                        ),
                                        const YMargin(10),
                                        Row(
                                          children: [
                                            Text(_value.course,
                                                textAlign: TextAlign.center,
                                                style: LectureAlertTextStyle
                                                    .normal
                                                    .copyWith(
                                                  color: lectureAlertWhite,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                            const Spacer(),
                                            Text(
                                                '${_value.date}, ${_value.time}',
                                                textAlign: TextAlign.center,
                                                style: LectureAlertTextStyle
                                                    .small
                                                    .copyWith(
                                                  color: lectureAlertWhite,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                        const YMargin(10),
                                        Row(
                                          children: [
                                            Text(_value.lecturer,
                                                textAlign: TextAlign.center,
                                                style: LectureAlertTextStyle
                                                    .normal
                                                    .copyWith(
                                                  color: lectureAlertWhite,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                        const YMargin(10),
                                        Row(
                                          children: [
                                            Text(_value.department,
                                                textAlign: TextAlign.center,
                                                style: LectureAlertTextStyle
                                                    .normal
                                                    .copyWith(
                                                  color: lectureAlertWhite,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                            const Spacer(),
                                            Text('Room ${_value.room}',
                                                textAlign: TextAlign.center,
                                                style: LectureAlertTextStyle
                                                    .normal
                                                    .copyWith(
                                                  color: lectureAlertWhite,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return Padding(
                                padding: REdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: const Divider(),
                              );
                            },
                            itemCount: auth.lectures.length),
                      )
                    : Flexible(
                        child: Center(
                          child: Text('Add Lectures now!!!!!!!',
                              textAlign: TextAlign.center,
                              style: LectureAlertTextStyle.medium.copyWith(
                                color: lectureAlertBlack,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      )
              ],
            );
          },
        ),
      ),
    );
  }
}
