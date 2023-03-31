import 'package:get/get.dart';
import 'package:inventory_tracker/domain/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
