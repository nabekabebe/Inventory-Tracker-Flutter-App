import 'dart:async';

import 'package:floor/floor.dart';
import 'package:inventory_tracker/core/common/app_constants.dart';
import 'package:inventory_tracker/data/data_provider/Inventory/inventory.dao.dart';
import 'package:inventory_tracker/data/data_provider/warehouse/warehouse.dao.dart';
import 'package:inventory_tracker/domain/entity/inventory.dart';
import 'package:inventory_tracker/domain/entity/warehouse.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(
    version: AppConstants.DatabaseVersion, entities: [Inventory, Warehouse])
abstract class AppDatabase extends FloorDatabase {
  InventoryDao get inventoryDao;

  WarehouseDao get warehouseDao;
}
