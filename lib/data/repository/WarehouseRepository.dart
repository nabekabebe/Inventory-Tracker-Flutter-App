import 'package:inventory_tracker/core/utils/network.dart';
import 'package:inventory_tracker/core/utils/networkBoundResource.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/dto/stock_info.dto.dart';
import 'package:inventory_tracker/data/dto/warehouse.dto.dart';
import 'package:inventory_tracker/domain/entity/warehouse.dart';
import 'package:inventory_tracker/domain/repository/IWarehouseRepository.dart';

class WarehouseRepository extends IWarehouseRepository {
  WarehouseRepository(super.apiService, super.databaseService) : super();

  @override
  Stream<Resource<List<Warehouse>>> fetchWarehouses() => networkBoundResource(
          () => databaseService.warehouse.getWarehouses(),
          () => apiService.warehouse.fetchAllWarehouses(), (fetchResult) async {
        final warehouses =
            fetchResult.map((item) => item.toWarehouse()).toList();
        databaseService.warehouse.replaceWarehouses(warehouses);
      }, (queryResult) async => await isNetworkConnected());

  @override
  Stream<Resource<Warehouse>> storeWarehouse(WarehouseAddDto warehouse) =>
      networkRequest(() => apiService.warehouse.storeWarehouse(warehouse),
          (fetchResult) => fetchResult.toWarehouse(), (transformedData) {
        databaseService.warehouse.insertWarehouse(transformedData);
      });

  @override
  Stream<Resource<List<WarehouseStockInfo>>> lowInShop() => networkRequest(
      () => apiService.warehouse.fetchLowInShop(),
      (fetchResult) => fetchResult,
      (transformedData) {});

  @override
  Stream<Resource> deleteWarehouse(int id) => networkBoundResource(
      () => databaseService.warehouse.deleteWarehouse(id).asStream(),
      () => apiService.inventory.deleteInventory(id),
      (fetchResult) async {},
      (queryResult) async => true);

  @override
  Stream<Resource<Warehouse?>> fetchWarehouse(int id) => networkBoundResource(
          () => databaseService.warehouse.getWarehouse(id),
          () => apiService.warehouse.fetchWarehouse(id), (fetchResult) async {
        //TODO: any value the below commented code adds?
        // await databaseService.inventory.replaceInventory(fetchResult.toInventory()).toList();
        databaseService.warehouse.replaceWarehouse(fetchResult.toWarehouse());
      }, (queryResult) async => await isNetworkConnected());

  @override
  Stream<Resource<Warehouse>> updateWarehouse(
          int id, WarehouseAddDto warehouseAddDto) =>
      networkRequest(
          () => apiService.warehouse.updateWarehouse(id, warehouseAddDto),
          (fetchResult) => fetchResult.toWarehouse(), (transformedData) {
        databaseService.warehouse.replaceWarehouse(transformedData);
      });
}
