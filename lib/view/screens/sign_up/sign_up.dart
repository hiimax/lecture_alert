import 'package:flutter/gestures.dart';

import '../../../data/provider/auth_provider.dart';
import '../../../data/provider/test_provider.dart';
import '../../../res/import/import.dart';
import '../sign_in/sign_in.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Validators {
  bool password = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Consumer2<AuthenticationProvider, TestProvider>(
            builder: (context, auth, test, child) {
              return Center(
                child: Padding(
                  padding: REdgeInsets.fromLTRB(18, 18, 18, 18),
                  child: Column(
                    children: [
                      Text(
                        'Sign Up',
                        style: LectureAlertTextStyle.medium.copyWith(
                          fontWeight: FontWeight.w700,
                          color: lectureAlertBlack,
                        ),
                      ),
                      const YMargin(15),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('First Name',
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
                            hintText: 'Enter  First Name',
                            textInputType: TextInputType.name,
                            controller: auth.firstName,
                            validator: (val) => validateName(val),
                          ),
                        ],
                      ),
                      const YMargin(16),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('Last Name',
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
                            hintText: 'Enter  Last Name',
                            textInputType: TextInputType.name,
                            controller: auth.lastName,
                            validator: (val) => validateName(val),
                          ),
                        ],
                      ),
                      const YMargin(16),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('Email',
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
                            hintText: 'Enter email',
                            textInputType: TextInputType.emailAddress,
                            controller: auth.email,
                            validator: (val) => validateEmail(val),
                          ),
                        ],
                      ),
                      const YMargin(16),
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
                            controller: auth.username,
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
                            controller: auth.password,
                            validator: (val) => validatePassword(val),
                            onchanged: (val) {
                              test.numberChecked = numberCharactersChecked(val);
                              test.symbolCharactersChecked =
                                  symbolCharactersChecked(val);
                              test.shortCharactersChecked =
                                  shortCharactersChecked(val);
                              test.upperandLowerCharactersChecked =
                                  upperandLowerCharactersChecked(val);
                            },
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
                                          Icons.remove_red_eye_outlined),
                                )),
                          ),
                        ],
                      ),
                      const YMargin(16),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text('Between 8 and 20 characters',
                                  textAlign: TextAlign.center,
                                  style: LectureAlertTextStyle.small.copyWith(
                                    color: test.shortCharactersChecked
                                        ? lectureAlertSubColor1
                                        : lectureAlertBlack,
                                    fontWeight: FontWeight.w300,
                                    decoration: test.shortCharactersChecked
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  )),
                              const XMargin(20),
                              Icon(
                                test.shortCharactersChecked
                                    ? Icons.verified
                                    : Icons.new_releases,
                                color: test.shortCharactersChecked
                                    ? lectureAlertGreen
                                    : lectureAlertPrimaryColor,
                                size: 14.sp,
                              ),
                            ],
                          ),
                          const YMargin(9),
                          Row(
                            children: [
                              Text('1 upper case letter',
                                  textAlign: TextAlign.center,
                                  style: LectureAlertTextStyle.small.copyWith(
                                    color: test.upperandLowerCharactersChecked
                                        ? lectureAlertSubColor1
                                        : lectureAlertBlack,
                                    fontWeight: FontWeight.w300,
                                    decoration:
                                        test.upperandLowerCharactersChecked
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                  )),
                              const XMargin(20),
                              Icon(
                                test.upperandLowerCharactersChecked
                                    ? Icons.verified
                                    : Icons.new_releases,
                                color: test.upperandLowerCharactersChecked
                                    ? lectureAlertGreen
                                    : lectureAlertPrimaryColor,
                                size: 14.sp,
                              ),
                            ],
                          ),
                          const YMargin(9),
                          Row(
                            children: [
                              Text('1 or more numbers',
                                  textAlign: TextAlign.center,
                                  style: LectureAlertTextStyle.small.copyWith(
                                    color: test.numberChecked
                                        ? lectureAlertSubColor1
                                        : lectureAlertBlack,
                                    fontWeight: FontWeight.w300,
                                    decoration: test.numberChecked
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  )),
                              const XMargin(20),
                              Icon(
                                test.numberChecked
                                    ? Icons.verified
                                    : Icons.new_releases,
                                color: test.numberChecked
                                    ? lectureAlertGreen
                                    : lectureAlertPrimaryColor,
                                size: 14.sp,
                              ),
                            ],
                          ),
                          const YMargin(9),
                          Row(
                            children: [
                              Text('1 or more special characters',
                                  textAlign: TextAlign.center,
                                  style: LectureAlertTextStyle.small.copyWith(
                                    color: test.symbolCharactersChecked
                                        ? lectureAlertSubColor1
                                        : lectureAlertBlack,
                                    fontWeight: FontWeight.w300,
                                    decoration: test.symbolCharactersChecked
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  )),
                              const XMargin(20),
                              Icon(
                                test.symbolCharactersChecked
                                    ? Icons.verified
                                    : Icons.new_releases,
                                color: test.symbolCharactersChecked
                                    ? lectureAlertGreen
                                    : lectureAlertPrimaryColor,
                                size: 14.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const YMargin(50),
                      CustomButton(
                        title: 'Sign Up',
                        loadingState: auth.registerBusy,
                        onPressed: () {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          final FormState? form = _formKey.currentState;
                          if (form!.validate()) {
                            auth.register(
                                context: context,
                                onSuccess: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => const SignInScreen()),
                                  );
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
                                  text: 'Already have an Account?  ',
                                  style: LectureAlertTextStyle.small.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: lectureAlertBlack,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Sign In',
                                  style: LectureAlertTextStyle.small.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: lectureAlertPrimaryColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const SignInScreen()),
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
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
