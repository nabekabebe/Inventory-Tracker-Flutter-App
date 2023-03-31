import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inventory_tracker/core/common/pages.dart';
import 'package:inventory_tracker/domain/controllers/auth_controller.dart';
import 'package:inventory_tracker/injection.dart';
import 'package:inventory_tracker/presentation/screens/Search/search_screen.dart';

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
      initialBinding: Pages.searchBinding,
      // home: AuthController.c.isNewUser()
      //     ? const CustomBoarding()
      //     : const SplashScreen(),
      home: const SearchPage(),
      getPages: Pages.pages,
    );
  }
}
