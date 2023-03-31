import 'package:inventory_tracker/core/database.dart';
import 'package:inventory_tracker/data/data_provider/Inventory/local_provider.dart';
import 'package:inventory_tracker/data/data_provider/warehouse/local_provider.dart';

class DatabaseService {
  final AppDatabase db;
  final LocalInventoryProvider _inventoryProvider = LocalInventoryProvider();

  final LocalWarehouseProvider _warehouseProvider = LocalWarehouseProvider();

  DatabaseService(this.db);

  LocalInventoryProvider get inventory => _inventoryProvider;

  LocalWarehouseProvider get warehouse => _warehouseProvider;
}
