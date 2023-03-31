import 'dart:io';

Future<bool> isNetworkConnected() async {
  try {
    final result = await InternetAddress.lookup('www.google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (e) {
    print("isNetworkConnected: Network exception!");
  }
  return false;
}
