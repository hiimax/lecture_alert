import '../import/import.dart';

class RouteNames {
  // All veiw route names
  static const splash = 'splash';
  static const signup = 'signUp';
  static const signIn = 'signIn';
  static const login = 'login';
  static const packages = 'packages';
  static const signUpEmailVerification = 'signUpEmailVerification';
  static const signInEmailVerification = 'signInEmailVerification';
  static const emailVerificationSuccess = 'emailVerificationSuccess';
  static const faceVerification = 'faceVerification';
  static const skipFaceVerification = 'skipFaceVerification';
  static const termsAndConditions = 'termsAndConditions';
  static const location = 'location';
  static const forgetPassword = 'forgetPassword';
  static const forgetPasswordSuccess = 'forgetPasswordSuccess';
  static const resetPasswordScreen = 'resetPasswordScreen';
  static const forgetPasswordVerification = 'forgetPasswordVerification';
  static const profileSetup = 'profileSetup';
  static const mainScreen = 'mainScreen';
  static const homeScreen = 'homeScreen';
  static const chatScreen = 'chatScreen';
  static const connectScreen = 'connectScreen';
  static const profileScreen = 'profileScreen';
  static const faceRecognition = 'faceRecognition';
  static const editBioScreen = 'editBioScreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    ///RouteNames.splashScreen: (context) => SplashScreen(),
    // splash: (context) => const SplashScreen(),
    //
    // connectScreen: (context) => const ConnectScreen(),
  };
}
