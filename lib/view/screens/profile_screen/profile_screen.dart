import '../../../res/import/import.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _firstName = '';
  String _lastName = '';
  String _username = '';
  String _email = '';

  @override
  void initState() {
    // TODO: implement initState
    getDetails();
    super.initState();
  }

  Future<void> getDetails() async {
    final pref = await SharedPreferences.getInstance();
    _firstName = pref.getString(
          "firstname",
        ) ??
        '';
    _lastName = pref.getString(
          "lastname",
        ) ??
        '';
    _username = pref.getString(
          "matricNumber",
        ) ??
        '';
    _email = pref.getString(
          "email",
        ) ??
        '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.fromLTRB(18, 18, 18, 18),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: ,
              children: [
                const CircleAvatar(
                  backgroundColor: lectureAlertPrimaryColor,
                  radius: 40,
                ),
                const YMargin(50),
                Row(
                  children: [
                    Text('First Name',
                        textAlign: TextAlign.center,
                        style: LectureAlertTextStyle.normal.copyWith(
                          color: lectureAlertBlack,
                          fontWeight: FontWeight.w700,
                        )),
                    const Spacer(),
                    Text(_firstName,
                        textAlign: TextAlign.center,
                        style: LectureAlertTextStyle.small.copyWith(
                          color: lectureAlertBlack,
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                const YMargin(20),
                Row(
                  children: [
                    Text('Last Name',
                        textAlign: TextAlign.center,
                        style: LectureAlertTextStyle.normal.copyWith(
                          color: lectureAlertBlack,
                          fontWeight: FontWeight.w700,
                        )),
                    const Spacer(),
                    Text(_lastName,
                        textAlign: TextAlign.center,
                        style: LectureAlertTextStyle.small.copyWith(
                          color: lectureAlertBlack,
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                const YMargin(20),
                Row(
                  children: [
                    Text('Matric No',
                        textAlign: TextAlign.center,
                        style: LectureAlertTextStyle.normal.copyWith(
                          color: lectureAlertBlack,
                          fontWeight: FontWeight.w700,
                        )),
                    const Spacer(),
                    Text(_username,
                        textAlign: TextAlign.center,
                        style: LectureAlertTextStyle.small.copyWith(
                          color: lectureAlertBlack,
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
                const YMargin(20),
                Row(
                  children: [
                    Text('Email',
                        textAlign: TextAlign.center,
                        style: LectureAlertTextStyle.normal.copyWith(
                          color: lectureAlertBlack,
                          fontWeight: FontWeight.w700,
                        )),
                    const Spacer(),
                    Text(_email,
                        textAlign: TextAlign.center,
                        style: LectureAlertTextStyle.small.copyWith(
                          color: lectureAlertBlack,
                          fontWeight: FontWeight.w700,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
