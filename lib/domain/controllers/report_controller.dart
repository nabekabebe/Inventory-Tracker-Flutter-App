import 'package:get/get.dart';
import 'package:inventory_tracker/data/data.dart';
import 'package:inventory_tracker/domain/controllers/base_controller.dart';
import 'package:inventory_tracker/domain/entity/report.dart';
import 'package:inventory_tracker/presentation/screens/Home/widgets/BarChartWrapper.dart';

enum DataType { annual, monthly, weekly }

class ReportController extends BaseController<Report> {
  static ReportController get c => Get.find<ReportController>();

  final isSortReversed = false.obs;

  RxMap<int, ChartData> selectedData = weeklyData.obs;
  Rx<DataType> selectedType = DataType.weekly.obs;

  void updateChart(DataType val) {
    selectedType.value = val;
    switch (val) {
      case DataType.annual:
        selectedData.value = annualData;
        break;
      case DataType.monthly:
        selectedData.value = monthlyData;
        break;
      default:
        selectedData.value = weeklyData;
    }
  }

  void exportToExcel() {

  }
}
