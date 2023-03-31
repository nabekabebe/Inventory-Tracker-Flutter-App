import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/app_constants.dart';
import 'package:inventory_tracker/core/database.dart';
import 'package:inventory_tracker/data/data_provider/Auth/local_provider.dart';
import 'package:inventory_tracker/data/data_provider/api_service.dart';
import 'package:inventory_tracker/data/data_provider/database_service.dart';
import 'package:inventory_tracker/data/repository/AuthRepository.dart';
import 'package:inventory_tracker/data/repository/InventoryRepository.dart';
import 'package:inventory_tracker/data/repository/WarehouseRepository.dart';
import 'package:inventory_tracker/domain/repository/IAuthRepository.dart';
import 'package:inventory_tracker/domain/repository/IInventoryRepository.dart';
import 'package:inventory_tracker/domain/repository/IWarehouseRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/utils/AuthInterceptor.dart';

Dio setClient() {
  final Dio dio = Dio();
  dio.interceptors
      .add(AuthInterceptor(Get.find(tag: AppConstants.GetxTagSessionManager)));
  dio.interceptors.add(LogInterceptor(responseBody: false));
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.options.baseUrl = AppConstants.BASE_URL;

  return dio;
}

void initializeRepositories(ApiService apiService, DatabaseService dbService) {
  Get.put<IAuthRepository>(AuthRepository(apiService), tag: 'auth');

  Get.put<IInventoryRepository>(InventoryRepository(apiService, dbService),
      tag: 'inv');

  Get.put<IWarehouseRepository>(WarehouseRepository(apiService, dbService),
      tag: 'ware');
}

setupLocator() async {
  await Get.putAsync<AppDatabase>(() async {
    AppDatabase db = await $FloorAppDatabase
        .databaseBuilder(AppConstants.DatabaseFileName)
        .build();

    return db;
  }, tag: AppConstants.GetxTagDatabase);

  await Get.putAsync<SharedPreferences>(() async {
    final pref = await SharedPreferences.getInstance();
    return pref;
  }, permanent: true, tag: AppConstants.GetxTagSharedPref);

  Get.put<SessionManager>(
      SessionManager(
          Get.find<SharedPreferences>(tag: AppConstants.GetxTagSharedPref)),
      tag: AppConstants.GetxTagSessionManager);

  Get.put<Dio>(setClient(), tag: AppConstants.GetxTagDio);

  Get.put<ApiService>(
      ApiService(
        Get.find(tag: AppConstants.GetxTagDio),
      ),
      tag: AppConstants.GetxTagApiService);

  Get.put<DatabaseService>(
      DatabaseService(
        Get.find(tag: AppConstants.GetxTagDatabase),
      ),
      tag: AppConstants.GetxTagDatabaseService);

  initializeRepositories(
      Get.find<ApiService>(tag: AppConstants.GetxTagApiService),
      Get.find<DatabaseService>(tag: AppConstants.GetxTagDatabaseService));
}
