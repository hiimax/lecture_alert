import '../import/import.dart';

class ResponsiveScreen extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveScreen({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 500 &&
      MediaQuery.of(context).size.width <= 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width > 1100) {
      return desktop!;
    } else if (size.width >= 835 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
