import '../../res/import/import.dart';

class DynamicLinkService extends ChangeNotifier {
  // DynamicLinkService._();
  // var refLink;
  Future<void> handleDynamicLinks(context) async {
    // 1. Get the initial dynamic link if the app is opened with a dynamic link
    // PendingDynamicLinkData? data =
    //     await FirebaseDynamicLinks.instance.getInitialLink();
    // 2. handle link that has been retrieved

    // 3. Register a link callback to fire if the app is opened up from the background
    // using a dynamic link.
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      _handleDeepLink(dynamicLinkData, context);
    }).onError((error) {});
  }

  // Future<Uri> createDynamicLink({required String refcode}) async {
  //   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  //
  //   final DynamicLinkParameters parameters = DynamicLinkParameters(
  //     // This should match firebase but without the username query param
  //     uriPrefix: 'https://zinari.page.link',
  //     // This can be whatever you want for the uri, https://yourapp.com/groupinvite?username=$userName
  //     link: Uri.parse('https://zinari.page.link/register?ref=$refcode'),
  //     androidParameters: AndroidParameters(
  //       packageName: 'com.zeenah.zinari',
  //       minimumVersion: 1,
  //     ),
  //     iosParameters: IOSParameters(
  //       bundleId: 'com.zeenah.zinari',
  //       minimumVersion: '1',
  //       appStoreId: '',
  //     ),
  //   );
  //   final link = await dynamicLinks.buildLink(parameters);
  //   final ShortDynamicLink shortLink =
  //       await dynamicLinks.buildShortLink(parameters);
  //   var url = shortLink.shortUrl;
  //   print(link);
  //   print(url);
  //   return url;
  // }

  Future<void> _handleDeepLink(PendingDynamicLinkData? data, context) async {
    final Uri deepLink = data!.link;

    var emailConfirm = deepLink.pathSegments.contains('emailConfirm');
    if (emailConfirm) {
      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   RouteNames.emailverified,
      //   (Route<dynamic> route) => route.settings.name == RouteNames.login,
      // );

      // // refLink = deepLink.queryParameters['ref'];
      // if (refLink != null) {
      //   // Get.toNamed(RouteNames.emailSignUp,arguments: refLink);
      //   Get.to(EmailSignUp(referal: refLink));
      // }
    }
  }
}
