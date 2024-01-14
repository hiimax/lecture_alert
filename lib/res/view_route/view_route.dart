import '../import/import.dart';

class RouteNames {
  // All veiw route names
  static const splash = 'splash';
  static const signup = 'signUp';
  static const signIn = 'signIn';
  static const login = 'login';

  static const mainScreen = 'mainScreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    ///RouteNames.splashScreen: (context) => SplashScreen(),
    // splash: (context) => const SplashScreen(),
    //
    splash: (context) => const SplashScreen(),
    signup: (context) => const SignUpScreen(),
    signIn: (context) => const SignInScreen(),
    mainScreen: (context) => const MainScreen(),
  };
}
