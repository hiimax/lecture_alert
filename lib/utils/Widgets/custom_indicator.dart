import '../../res/import/import.dart';

class AppBarNavigation extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? color;
  const AppBarNavigation(
      {Key? key, required this.title, required this.subtitle, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back)),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: lectureAlertTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color ?? lectureAlertTextColor,
            ),
          ),
        ],
      )),
    );
  }
}

class AppBarNavigation1 extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? color;

  const AppBarNavigation1(
      {Key? key, required this.title, required this.subtitle, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: lectureAlertTextColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color ?? lectureAlertTextColor,
            ),
          ),
        ],
      )),
    );
  }
}

class AppBarNavigationWithoutPop extends StatelessWidget {
  final String title;
  final Widget? widget;

  const AppBarNavigationWithoutPop({Key? key, required this.title, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: lectureAlertTextColor,
            ),
          ),
          widget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
