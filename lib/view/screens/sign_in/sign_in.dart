import 'package:flutter/gestures.dart';

import '../../../data/provider/auth_provider.dart';
import '../../../res/import/import.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with Validators {
  bool password = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                      'Sign In',
                      style: LectureAlertTextStyle.subMedium.copyWith(
                        fontWeight: FontWeight.w500,
                        color: lectureAlertBlack,
                      ),
                    ),
                    const YMargin(20),
                    const YMargin(15),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Matric Number',
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
                          hintText: 'Enter Matric Number',
                          textInputType: TextInputType.text,
                          controller: auth.loginemail,
                          validator: (val) => validateUserName(val),
                        ),
                      ],
                    ),
                    const YMargin(16),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text('Password',
                                textAlign: TextAlign.center,
                                style: LectureAlertTextStyle.normal.copyWith(
                                  color: lectureAlertTextColor,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                        const YMargin(4),
                        CustomTextFormField(
                          obscureText: password,
                          readonly: false,
                          hintText: 'Enter password',
                          textInputType: TextInputType.text,
                          controller: auth.loginpassword,
                          // validator: (val) => validatePassword(val),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                password = !password;
                              });
                            },
                            child: SizedBox(
                                width: 16.w,
                                height: 16.h,
                                child: password
                                    ? const Icon(Icons.hide_source_sharp)
                                    : const Icon(
                                        Icons.remove_red_eye_outlined)),
                          ),
                        ),
                      ],
                    ),
                    const YMargin(10),
                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: auth.rememberMe,
                              activeColor: lectureAlertPrimaryColor,
                              checkColor: lectureAlertWhite,
                              autofocus: true,
                              // fillColor: MaterialStateProperty.all(lectureAlertBlack),
                              focusColor: lectureAlertBlack,
                              hoverColor: lectureAlertBlack,
                              fillColor:
                                  MaterialStateProperty.all(lectureAlertBlack),
                              onChanged: (value) {
                                auth.toggleRememberMe();
                              },
                            ),
                            Text('Remember Me',
                                textAlign: TextAlign.center,
                                style: LectureAlertTextStyle.small.copyWith(
                                  color: lectureAlertBlack,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text('Forgot Password ?',
                              textAlign: TextAlign.center,
                              style: LectureAlertTextStyle.small.copyWith(
                                color: lectureAlertPrimaryColor,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ],
                    ),
                    const YMargin(0),
                    const YMargin(50),
                    CustomButton(
                      title: 'Sign In',
                      loadingState: auth.loginBusy,
                      onPressed: () {
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
                        final FormState? form = _formKey.currentState;
                        if (form!.validate()) {
                          auth.login(
                              context: context,
                              onSuccess: () async {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => const MainScreen()),
                                    (route) => false);
                              });
                        }
                      },
                    ),
                    const YMargin(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Are you new here?  ',
                                style: LectureAlertTextStyle.small.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: lectureAlertBlack,
                                ),
                              ),
                              TextSpan(
                                text: 'Sign up',
                                style: LectureAlertTextStyle.small.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: lectureAlertPrimaryColor,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) =>
                                              const SignUpScreen()),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
