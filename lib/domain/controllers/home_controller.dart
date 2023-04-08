import 'dart:isolate';

import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/routes.dart';
import 'package:inventory_tracker/core/utils/common.dart';
import 'package:inventory_tracker/data/data_provider/Auth/local_provider.dart';
import 'package:inventory_tracker/domain/controllers/base_controller.dart';
import 'package:inventory_tracker/domain/entity/inventory.dart';
import 'package:inventory_tracker/domain/entity/user.dart';
import 'package:inventory_tracker/domain/repository/IInventoryRepository.dart';

class HomeController extends BaseController<Inventory> {
  static HomeController get c => Get.find<HomeController>();

  final inventoryRepository = Get.find<IInventoryRepository>(tag: 'inv');
  final sessionManager = Get.find<SessionManager>(tag: 'session');

  final RxList stockData = [].obs;

  final receivePort = ReceivePort();

  @override
  void onInit() {
    super.onInit();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if (user == null) {
    //     Get.offAllNamed(Routes.LOGIN, arguments: {'withError': true});
    //   }
    // });
    // // fetchStocks();
    // fetchLowInStock();
  }

  User? get user => sessionManager.getLoggedInUser();

  void fetchStocks() {
    inventoryRepository.fetchInventories().forEach((result) {
      result.when(Success: (inventories) {
        loading.value = false;
        dataList.value = inventories;
      }, Loading: (inventories) {
        loading.value = true;
        if (inventories.isNotNull) {
          dataList.value = inventories!;
        }
      }, Error: (error, inventories) {
        loading.value = false;

        errorMessage.value = error;
        if (inventories.isNotNull) {
          dataList.value = inventories!;
        }
      });
    });
  }

  fetchLowInStock() async {
    inventoryRepository.fetchLowInStock().forEach((result) {
      result.when(Success: (stocks) {
        loading.value = false;
        stockData.value = stocks;
        print(stocks);
      }, Loading: (_) {
        loading.value = true;
      }, Error: (error, _) {
        loading.value = false;
        errorMessage.value = error;
      });
    });
  }

  void fetchLowInShop() {}

  void fetchReport() {}

  void logout() {
    sessionManager.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
