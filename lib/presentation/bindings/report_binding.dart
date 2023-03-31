import 'package:get/get.dart';
import 'package:inventory_tracker/domain/controllers/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportController());
  }
}
