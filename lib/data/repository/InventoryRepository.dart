import 'package:inventory_tracker/core/utils/network.dart';
import 'package:inventory_tracker/core/utils/networkBoundResource.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/dto/InventorySellInfo.dart';
import 'package:inventory_tracker/data/dto/inventory.dto.dart';
import 'package:inventory_tracker/data/dto/inventory_update.dto.dart';
import 'package:inventory_tracker/data/dto/stock_info.dto.dart';
import 'package:inventory_tracker/domain/entity/inventory.dart';
import 'package:inventory_tracker/domain/repository/IInventoryRepository.dart';

class InventoryRepository extends IInventoryRepository {
  InventoryRepository(super.apiService, super.databaseService) : super();

  @override
  Stream<Resource<List<Inventory>>> fetchInventories() => networkBoundResource(
          () => databaseService.inventory.getInventories(),
          () => apiService.inventory.fetchAllInventories(),
          (fetchResult) async {
        final inventories =
            fetchResult.map((item) => item.toInventory()).toList();
        databaseService.inventory.replaceInventories(inventories);
      }, (queryResult) async => await isNetworkConnected());

  @override
  Stream<Resource<List<InventoryStockInfo>>> fetchLowInStock() =>
      networkRequest(() => apiService.inventory.fetchLowStock(),
          (fetchResult) => fetchResult, (transformedData) {});

  @override
  Stream<Resource<Inventory>> addInventory(InventoryDto inventoryDto) =>
      networkRequest(() => apiService.inventory.storeInventory(inventoryDto),
          (fetchResult) => fetchResult.toInventory(), (transformedData) {
        databaseService.inventory.insertInventory(transformedData);
      });

  @override
  Stream<Resource> deleteInventory(int id) => networkBoundResource(
      () => databaseService.inventory.deleteInventory(id).asStream(),
      () => apiService.inventory.deleteInventory(id),
      (fetchResult) async {},
      (queryResult) async => true);

  @override
  Stream<Resource<Inventory?>> fetchInventory(int id) => networkBoundResource(
          () => databaseService.inventory.getInventory(id),
          () => apiService.inventory.fetchInventory(id), (fetchResult) async {
        //TODO: any value the below commented code adds?
        // await databaseService.inventory.replaceInventory(fetchResult.toInventory()).toList();
        databaseService.inventory.replaceInventory(fetchResult.toInventory());
      }, (queryResult) async => await isNetworkConnected());

  @override
  Stream<Resource> refundInventory(int id, int transactionId) => networkRequest(
      () => apiService.inventory.refundInventory(id, transactionId),
      (fetchResult) => fetchResult,
      (transformedData) {});

  @override
  Stream<Resource> sellInventory(int id, InventorySellInfoDto sellInfo) =>
      networkRequest(() => apiService.inventory.sellInventory(id, sellInfo),
          (fetchResult) => fetchResult, (transformedData) {});

  @override
  Stream<Resource<Inventory>> updateInventory(int id, InventoryUpdate data) =>
      networkRequest(() => apiService.inventory.updateInventory(id, data),
          (fetchResult) => fetchResult.toInventory(), (transformedData) {
        databaseService.inventory.replaceInventory(transformedData);
      });
}
