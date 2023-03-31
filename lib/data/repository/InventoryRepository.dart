import 'package:inventory_tracker/core/utils/network.dart';
import 'package:inventory_tracker/core/utils/networkBoundResource.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
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
        await databaseService.inventory.replaceInventories(inventories);
      }, (queryResult) async => await isNetworkConnected());

  @override
  Stream<Resource<List<StockInfo>>> fetchLowInStock() => apiFetch(
      () => apiService.inventory.fetchLowStock(),
      (fetchResult) => fetchResult,
      (transformedData) {});

// @override
// Stream<Resource<List<Inventory>>> fetchWeeklyReport() => apiFetch(
//     () => apiService.inventory.fetchLowStock(),
//     (fetchResult) => fetchResult.map((item) => item.toInventory()).toList(),
//     (transformedData) {});
}
