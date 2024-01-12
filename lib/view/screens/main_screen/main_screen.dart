import '../../../res/import/import.dart';
import '../home_screen/home_screen.dart';
import '../lecture_screen/lecture_screen.dart';
import '../profile_screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController? _pageController;
  int _currentIndex = 0;
  bool showSheet = false;

  final List<Widget> _pages = [
    const HomeScreen(),
    const LectureScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    _pageController = PageController(
      keepPage: true,
      initialPage: 0,
    );
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
    showSheet = false;
    setState(() {});
    _pageController!.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () => Future<bool>.value(false),
        child: Scaffold(
          body: PageView(
            onPageChanged: onPageChanged,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
          bottomNavigationBar: MobileBottomNavigation(
            onPressed: onPageChanged,
            currentIndex: _currentIndex,
          ),
        ));
  }
}
