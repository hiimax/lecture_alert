import '../../../data/provider/auth_provider.dart';
import '../../../res/import/import.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _loading = false;
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //
    // });
    callApi();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void callApi() {
    setState(() {
      _loading = true;
    });
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        _loading = false;
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (ctx) => const SignUpScreen()),
          (route) => false);
    });

    // Future.delayed(const Duration(seconds: 0), () async {
    //   final user = Provider.of<AuthenticationProvider>(context, listen: false);
    //   final prefs = await SharedPreferences.getInstance();
    //   // await user.getRememberMeStatus().then((value) async {
    //   //   if (value) {
    //   //     perm.getCurrentPosition().whenComplete(() async {
    //   //       if (perm.currentPosition != null) {
    //   //         user.login(
    //   //             data: {
    //   //               "email": EncryptData.decryptAES(
    //   //                   prefs.getString("email") ?? '', 'email67891234567'),
    //   //               "password": EncryptData.decryptAES(
    //   //                   prefs.getString("password") ?? '', 'password91234567'),
    //   //             },
    //   //             showError: false,
    //   //             context: context,
    //   //             onSuccess: () {
    //   //             });
    //   //       }
    //   //     });
    //   //   }
    //   // });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Consumer<AuthenticationProvider>(
            builder: (context, auth, child) {
              return Column(
                children: [
                  const YMargin(20),
                  const Spacer(),
                  Image.asset(
                      'WhatsApp_Image_2024-01-12_at_01.01.35-removebg-preview'
                          .mobilepng),
                  const Spacer(),
                  Text(
                    'Never miss a lecture',
                    style: LectureAlertTextStyle.subHeading.copyWith(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: lectureAlertPrimaryColor,
                    ),
                  ),
                  const YMargin(15),
                  _loading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: lectureAlertPrimaryColor,
                        ))
                      : const SizedBox.shrink(),
                  const YMargin(50),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
