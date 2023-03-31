import 'package:get/get.dart';
import 'package:inventory_tracker/domain/controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
