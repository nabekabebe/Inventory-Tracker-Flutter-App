import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inventory_tracker/core/common/app_constants.dart';
import 'package:inventory_tracker/core/common/pages.dart';
import 'package:inventory_tracker/domain/controllers/auth_controller.dart';
import 'package:inventory_tracker/domain/controllers/home_controller.dart';
import 'package:inventory_tracker/domain/controllers/report_controller.dart';
import 'package:inventory_tracker/domain/controllers/search_controller.dart';
import 'package:inventory_tracker/domain/controllers/warehouse_controller.dart';
import 'package:inventory_tracker/injection.dart';
import 'package:inventory_tracker/presentation/screens/Home/home_screen.dart';
import 'package:inventory_tracker/presentation/screens/Search/search_screen.dart';
import 'package:inventory_tracker/presentation/screens/report/report.dart';
import 'package:inventory_tracker/presentation/screens/splash/custom_boarding.dart';
import 'package:inventory_tracker/presentation/screens/splash/splash_screen.dart';
import 'package:inventory_tracker/presentation/screens/warehouse/warehouse_screen.dart';

import 'core/common/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  Get.put<AuthController>(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: Pages.authBinding,
      home: AuthController.c.isNewUser()
          ? const CustomBoarding()
          : const SplashScreen(),
      // home: CreateTransfer(),
      getPages: Pages.pages,
    );
  }
}

class InventoryView extends StatefulWidget {
  final Widget? appBar;
  final Widget? floatingButton;

  const InventoryView({
    Key? key,
    this.appBar,
    this.floatingButton,
  }) : super(key: key);

  @override
  State<InventoryView> createState() => _InventoryViewState();
}

class _InventoryViewState extends State<InventoryView> {
  int currentIndex = 0;

  @override
  void initState() {
    Get.put<HomeController>(HomeController());
    Get.put<WarehouseController>(WarehouseController());
    Get.put<ReportController>(ReportController());
    Get.put<SearchController>(SearchController());
    super.initState();
  }

  final _pages = const [
    HomePage(),
    SearchPage(),
    WarehousePage(),
    ReportPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.teal,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (int page) {
            setState(() {
              currentIndex = page;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: AppConstants.bottomNavItems),
      body: _pages[currentIndex],
      floatingActionButton: widget.floatingButton,
    );
  }
}
