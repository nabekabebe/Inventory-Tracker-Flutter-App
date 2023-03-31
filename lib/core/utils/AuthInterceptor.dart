import 'package:dio/dio.dart';
import 'package:inventory_tracker/data/data_provider/Auth/local_provider.dart';
import 'package:inventory_tracker/data/data_provider/Auth/remote_provider.dart';

class AuthInterceptor implements Interceptor {
  late final SessionManager session;

  AuthInterceptor(this.session) : super();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(">>>>>>>[Error From Backend]");
    print(err.response);
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Authorization': "Bearer ${session.buildAuthToken()}",
      'Accept': "application/json"
    });

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final url = response.requestOptions.uri.toString();
    if ((url.endsWith(RemoteAuthProvider.loginEndpoint) ||
            url.endsWith(RemoteAuthProvider.registerEndpoint)) &&
        response.statusCode == 200) {
      session.saveToken(response.data['data']['token']);
      session.setIsManager(
          response.data['data']['user']['is_manager'].toString() == "1");
    }
    handler.next(response);
  }
}
