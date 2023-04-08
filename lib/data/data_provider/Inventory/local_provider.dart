import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/app_constants.dart';
import 'package:inventory_tracker/core/database.dart';
import 'package:inventory_tracker/data/data_provider/Inventory/inventory.dao.dart';
import 'package:inventory_tracker/domain/entity/inventory.dart';

class LocalInventoryProvider {
  final InventoryDao inventoryDao =
      Get.find<AppDatabase>(tag: AppConstants.GetxTagDatabase).inventoryDao;

  Stream<List<Inventory>> getInventories() => inventoryDao.getAll();

  Stream<Inventory?> getInventory(int id) => inventoryDao.getOne(id);

  Future<int> insertInventory(Inventory inventory) =>
      inventoryDao.insertOne(inventory);

  Future<List<int>> insertInventories(List<Inventory> inventories) =>
      inventoryDao.insertAll(inventories);

  Stream replaceInventory(Inventory inventory) =>
      inventoryDao.replace(inventory).asStream();

  Stream replaceInventories(List<Inventory> inventories) =>
      inventoryDao.replaceAll(inventories).asStream();

  Future deleteInventory(int inventoryId) =>
      inventoryDao.deleteOne(inventoryId);

  Future deleteInventories() => inventoryDao.deleteAll();
}
