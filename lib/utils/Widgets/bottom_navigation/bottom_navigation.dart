import '../../../../res/import/import.dart';

class MobileBottomNavigation extends StatelessWidget {
  const MobileBottomNavigation({
    super.key,
    required this.onPressed,
    required this.currentIndex,
  });
  final Function(int)? onPressed;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return SizedBox(
        height: (62.h),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: lectureAlertBlack,
          selectedIconTheme:
              const IconThemeData(color: lectureAlertPrimaryColor),
          showSelectedLabels: true,
          selectedItemColor: lectureAlertWhite,
          unselectedItemColor: lectureAlertGrey,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          currentIndex: currentIndex,
          onTap: onPressed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.holiday_village_outlined,
                color: lectureAlertGrey,
              ),
              // icon: Image.asset(
              //   'home'.mobilepng,
              //   color: lectureAlertGrey,
              // ),
              label: 'Home',
              activeIcon: Icon(
                Icons.holiday_village,
                color: lectureAlertWhite,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.collections_outlined,
                color: lectureAlertGrey,
              ),
              // icon: Image.asset(
              //   'home'.mobilepng,
              //   color: lectureAlertGrey,
              // ),
              label: 'Lecture',
              activeIcon: Icon(
                Icons.collections_outlined,
                color: lectureAlertWhite,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: lectureAlertGrey,
              ),
              // icon: Image.asset(
              //   'home'.mobilepng,
              //   color: lectureAlertGrey,
              // ),
              label: 'Profile',
              activeIcon: Icon(
                Icons.person,
                color: lectureAlertWhite,
              ),
            ),
          ],
        ),
      );
    });
  }
}
