import '../../res/import/import.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();
var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory? dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  await Hive.openBox("app_data");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 752),
      builder: (context, child) => MultiProvider(
        providers: providers,
        child: GetMaterialApp(
          builder: (BuildContext context, Widget? widget) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return CustomError(errorDetails: errorDetails);
            };
            return widget!;
          },
          debugShowCheckedModeBanner: false,
          title: StringConstants.appName,
          theme: LectureAlerthelper.lightTheme(),
          initialRoute: '/',
          navigatorKey: navigatorKey,
          routes: RouteNames.routes,
          home: Builder(builder: (context) {
            SizeConfig.init(context);
            return const SplashScreen();
          }),
        ),
      ),
    );
  }
}
