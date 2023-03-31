import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/app_constants.dart';
import 'package:inventory_tracker/data/data_provider/Auth/local_provider.dart';

class SplashController extends GetxController {
  static SplashController get c => Get.find<SplashController>();

  final sessionManager =
      Get.find<SessionManager>(tag: AppConstants.GetxTagSessionManager);

  //status fields
  final isLoggedIn = false.obs;
}
