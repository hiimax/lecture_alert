import '../../../res/import/import.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.fromLTRB(18, 18, 18, 18),
        child: Column(
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
            Flexible(
              child: ListView.separated(
                  cacheExtent: 100,
                  itemBuilder: (ctx, index) {
                    return Padding(
                      padding: REdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: lectureAlertBlack,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                  color: lectureAlertBlack.withOpacity(0.5),
                                  offset: const Offset(3, 3),
                                  blurRadius: 8,
                                  spreadRadius: 0)
                            ]),
                        child: Padding(
                          padding: REdgeInsets.fromLTRB(18, 18, 18, 18),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.notification_important,
                                color: lectureAlertWhite,
                              ),
                              const YMargin(10),
                              Row(
                                children: [
                                  Text('GST 101',
                                      textAlign: TextAlign.center,
                                      style:
                                          LectureAlertTextStyle.normal.copyWith(
                                        color: lectureAlertWhite,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  const Spacer(),
                                  Text('10AM',
                                      textAlign: TextAlign.center,
                                      style:
                                          LectureAlertTextStyle.small.copyWith(
                                        color: lectureAlertWhite,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ],
                              ),
                              const YMargin(10),
                              Row(
                                children: [
                                  Text('Dr Salam Emmanuel',
                                      textAlign: TextAlign.center,
                                      style:
                                          LectureAlertTextStyle.normal.copyWith(
                                        color: lectureAlertWhite,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ],
                              ),
                              const YMargin(10),
                              Row(
                                children: [
                                  Text('Science',
                                      textAlign: TextAlign.center,
                                      style:
                                          LectureAlertTextStyle.normal.copyWith(
                                        color: lectureAlertWhite,
                                        fontWeight: FontWeight.w700,
                                      )),
                                  const Spacer(),
                                  Text('Room 302',
                                      textAlign: TextAlign.center,
                                      style:
                                          LectureAlertTextStyle.normal.copyWith(
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
                  itemCount: 20),
            )
          ],
        ),
      ),
    );
  }
}
