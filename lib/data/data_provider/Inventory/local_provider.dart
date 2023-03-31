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

  Future<void> insertInventory(Inventory inventory) =>
      inventoryDao.insertOne(inventory);

  Future<void> insertInventories(List<Inventory> inventories) =>
      inventoryDao.insertAll(inventories);

  Future<void> replaceInventories(List<Inventory> inventories) =>
      inventoryDao.replaceAll(inventories);

  Future<void> deleteInventory(Inventory inventory) =>
      inventoryDao.deleteOne(inventory);

  Future<void> deleteInventories() => inventoryDao.deleteAll();
}
