import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/app_constants.dart';
import 'package:inventory_tracker/core/database.dart';
import 'package:inventory_tracker/data/data_provider/warehouse/warehouse.dao.dart';
import 'package:inventory_tracker/domain/entity/warehouse.dart';

class LocalWarehouseProvider {
  final WarehouseDao warehouseDao =
      Get.find<AppDatabase>(tag: AppConstants.GetxTagDatabase).warehouseDao;

  Stream<List<Warehouse>> getWarehouses() => warehouseDao.getAll();

  Stream<Warehouse?> getWarehouse(int id) => warehouseDao.getOne(id);

  Future<int> insertWarehouse(Warehouse warehouse) =>
      warehouseDao.insertOne(warehouse);

  Future<List<int>> insertWarehouses(List<Warehouse> warehouses) =>
      warehouseDao.insertAll(warehouses);

  Stream replaceWarehouses(List<Warehouse> warehouses) =>
      warehouseDao.replaceAll(warehouses).asStream();

  Stream replaceWarehouse(Warehouse warehouses) =>
      warehouseDao.replace(warehouses).asStream();

  Future deleteWarehouse(int id) => warehouseDao.deleteOne(id);

  Future deleteWarehouses() => warehouseDao.deleteAll();
}
