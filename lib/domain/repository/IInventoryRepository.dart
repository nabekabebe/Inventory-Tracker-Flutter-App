import 'package:flutter/cupertino.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/data_provider/api_service.dart';
import 'package:inventory_tracker/data/data_provider/database_service.dart';
import 'package:inventory_tracker/data/dto/stock_info.dto.dart';
import 'package:inventory_tracker/domain/entity/inventory.dart';

abstract class IInventoryRepository {
  @protected
  late final ApiService apiService;
  @protected
  late final DatabaseService databaseService;

  IInventoryRepository(this.apiService, this.databaseService);

  Stream<Resource<List<Inventory>>> fetchInventories();

  Stream<Resource<List<StockInfo>>> fetchLowInStock();

// Stream<Resource<List<Inventory>>> fetchWeeklyReport();
}
