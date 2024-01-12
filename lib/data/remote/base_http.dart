import '../../res/import/import.dart';

class AlsTransformer extends BackgroundTransformer {}

class AlsBaseHttpService {
  late Dio http;

  AlsBaseHttpService() {
    http = Dio(BaseOptions(
        baseUrl: ApiRoutes.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          'inst-platform': defaultTargetPlatform == TargetPlatform.iOS
              ? 'IPHONE'
              : defaultTargetPlatform == TargetPlatform.android
                  ? 'DROID'
                  : 'WEB',
          'inst-appversion': '0.0',
          'inst-app': 'c',
        }))
      ..interceptors.add(InterceptorsWrapper(onRequest: (opts, handler) async {
        if (defaultTargetPlatform == TargetPlatform.android ||
            defaultTargetPlatform == TargetPlatform.iOS) {
          String? token = await LocalStorage.getItem("token");
          opts.headers.addAll({'Authorization': "Bearer $token"});
        } else {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          final String? token = prefs.getString('token');
          opts.headers.addAll({'Authorization': "Bearer $token"});
        }

        return handler.next(opts);
      }, onError: (err, handler) {
        logger.e(err.response?.data.toString());
        return handler.next(err);
      }, onResponse: (response, handler) {
        logger.d({"url": response.requestOptions.path, "data": response.data});
        return handler.next(response);
      }));
  }
}
