import 'package:flutter/cupertino.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/data_provider/api_service.dart';
import 'package:inventory_tracker/data/data_provider/database_service.dart';
import 'package:inventory_tracker/data/dto/warehouse.dto.dart';
import 'package:inventory_tracker/domain/entity/warehouse.dart';

abstract class IWarehouseRepository {
  @protected
  late final ApiService apiService;
  @protected
  late final DatabaseService databaseService;

  IWarehouseRepository(this.apiService, this.databaseService);

  Stream<Resource<List<Warehouse>>> fetchWarehouses();

  Stream<Resource<bool>> addWarehouse(WarehouseAddDto warehouse);
}
