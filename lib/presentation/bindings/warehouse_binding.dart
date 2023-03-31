import 'package:get/get.dart';
import 'package:inventory_tracker/domain/controllers/warehouse_controller.dart';

class WarehouseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WarehouseController());
  }
}
