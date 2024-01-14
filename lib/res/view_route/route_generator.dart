import '../import/import.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return CustomSlideTransition(child: const SplashScreen());
      case RouteNames.signup:
        return CustomSlideTransition(child: const SignUpScreen());
      case RouteNames.signIn:
        return CustomSlideTransition(child: const SignInScreen());
      case RouteNames.mainScreen:
        return CustomSlideTransition(child: const MainScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return CustomSlideTransition(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Page not found',
            style: TextStyle(color: Colors.red),
          ),
        ),
        body: const Center(
          child: Text(
            'Error! Page not found',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
