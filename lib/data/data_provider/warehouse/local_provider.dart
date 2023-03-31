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

  Future<void> insertWarehouse(Warehouse warehouse) =>
      warehouseDao.insertOne(warehouse);

  Future<void> insertWarehouses(List<Warehouse> warehouses) =>
      warehouseDao.insertAll(warehouses);

  Future<void> replaceWarehouses(List<Warehouse> warehouses) =>
      warehouseDao.replaceAll(warehouses);

  Future<void> deleteWarehouse(Warehouse warehouse) =>
      warehouseDao.deleteOne(warehouse);

  Future<void> deleteWarehouses() => warehouseDao.deleteAll();
}
