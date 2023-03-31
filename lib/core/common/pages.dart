import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/routes.dart';
import 'package:inventory_tracker/presentation/bindings/auth_binding.dart';
import 'package:inventory_tracker/presentation/bindings/home_binding.dart';
import 'package:inventory_tracker/presentation/bindings/inventory_binding.dart';
import 'package:inventory_tracker/presentation/bindings/report_binding.dart';
import 'package:inventory_tracker/presentation/bindings/search_binding.dart';
import 'package:inventory_tracker/presentation/bindings/warehouse_binding.dart';
import 'package:inventory_tracker/presentation/screens/Home/home_screen.dart';
import 'package:inventory_tracker/presentation/screens/Search/search_screen.dart';
import 'package:inventory_tracker/presentation/screens/auth/login_page.dart';
import 'package:inventory_tracker/presentation/screens/auth/signup_page.dart';
import 'package:inventory_tracker/presentation/screens/inventory/inventory_add.dart';
import 'package:inventory_tracker/presentation/screens/report/report.dart';
import 'package:inventory_tracker/presentation/screens/warehouse/warehouse_screen.dart';

class Pages {
  static final homeBinding = HomeBinding();
  static final authBinding = AuthBinding();
  static final searchBinding = SearchBinding();

  static final inventoryBinding = InventoryBinding();
  static final warehouseBinding = WarehouseBinding();
  static final reportBinding = ReportBinding();

  static final List<GetPage> pages = [
    GetPage(
        name: Routes.HOME, page: () => const HomePage(), binding: homeBinding),
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: authBinding),
    GetPage(
        name: Routes.REGISTER, page: () => SignupPage(), binding: authBinding),
    GetPage(
        name: Routes.SEARCH,
        page: () => const SearchPage(),
        binding: searchBinding),
    GetPage(
        name: Routes.ADD_INVENTORY,
        page: () => const AddInventory(),
        binding: inventoryBinding),
    GetPage(
        name: Routes.WAREHOUSE,
        page: () => const WarehousePage(),
        binding: warehouseBinding),
    GetPage(
        name: Routes.REPORT,
        page: () => const ReportPage(),
        binding: reportBinding),
  ];
}
