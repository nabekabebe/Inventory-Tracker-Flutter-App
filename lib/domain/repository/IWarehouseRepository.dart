import 'package:flutter/cupertino.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/data_provider/api_service.dart';
import 'package:inventory_tracker/data/data_provider/database_service.dart';
import 'package:inventory_tracker/data/dto/stock_info.dto.dart';
import 'package:inventory_tracker/data/dto/warehouse.dto.dart';
import 'package:inventory_tracker/domain/entity/warehouse.dart';

abstract class IWarehouseRepository {
  @protected
  late final ApiService apiService;
  @protected
  late final DatabaseService databaseService;

  IWarehouseRepository(this.apiService, this.databaseService);

  Stream<Resource<List<Warehouse>>> fetchWarehouses();

  Stream<Resource<Warehouse?>> fetchWarehouse(int id);

  Stream<Resource<Warehouse>> updateWarehouse(
      int id, WarehouseAddDto warehouseAddDto);

  Stream<Resource> deleteWarehouse(int id);

  Stream<Resource<List<WarehouseStockInfo>>> lowInShop();

  Stream<Resource<Warehouse>> storeWarehouse(WarehouseAddDto warehouse);
}
