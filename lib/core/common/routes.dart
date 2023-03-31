import 'package:get/get.dart';

class Routes {
  static const REGISTER = '/register';
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const SEARCH = '/search';
  static const ADD_INVENTORY = '/add_inventory';
  static const WAREHOUSE = '/warehouse';
  static const REPORT = '/report';

  static Map<int, String> routeMap = {
    0: Routes.HOME,
    1: Routes.SEARCH,
    2: Routes.WAREHOUSE,
    3: Routes.REPORT,
  };

  static switchRoute(int index) {
    switch (index) {
      case 0:
        Get.offAllNamed(Routes.routeMap[0]!);
        break;
      case 1:
        Get.offAllNamed(Routes.routeMap[1]!);
        break;
      case 2:
        Get.offAllNamed(Routes.routeMap[2]!);
        break;
      case 3:
        Get.offAllNamed(Routes.routeMap[3]!);
        break;
    }
  }
}
