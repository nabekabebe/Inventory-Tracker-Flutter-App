import 'package:get/get.dart';
import 'package:inventory_tracker/domain/controllers/inventory_controller.dart';

class InventoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InventoryController());
  }
}
