import 'package:flutter/cupertino.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/data_provider/api_service.dart';
import 'package:inventory_tracker/data/data_provider/database_service.dart';
import 'package:inventory_tracker/data/dto/InventorySellInfo.dart';
import 'package:inventory_tracker/data/dto/inventory.dto.dart';
import 'package:inventory_tracker/data/dto/inventory_update.dto.dart';
import 'package:inventory_tracker/data/dto/stock_info.dto.dart';
import 'package:inventory_tracker/domain/entity/inventory.dart';

abstract class IInventoryRepository {
  @protected
  late final ApiService apiService;
  @protected
  late final DatabaseService databaseService;

  IInventoryRepository(this.apiService, this.databaseService);

  Stream<Resource<List<Inventory>>> fetchInventories();

  Stream<Resource<Inventory?>> fetchInventory(int id);

  Stream<Resource<Inventory>> updateInventory(int id, InventoryUpdate data);

  Stream<Resource> deleteInventory(int id);

  Stream<Resource> sellInventory(int id, InventorySellInfoDto sellInfo);

  Stream<Resource> refundInventory(int id, int transactionId);

  Stream<Resource<Inventory>> addInventory(InventoryDto inventoryDto);

  Stream<Resource<List<InventoryStockInfo>>> fetchLowInStock();
}
