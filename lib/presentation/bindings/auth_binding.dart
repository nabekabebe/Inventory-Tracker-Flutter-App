import 'package:get/get.dart';
import 'package:inventory_tracker/domain/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
