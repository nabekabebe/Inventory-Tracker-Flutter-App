// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  InventoryDao? _inventoryDaoInstance;

  WarehouseDao? _warehouseDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Inventory` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `createdAt` TEXT NOT NULL, `barcode` TEXT NOT NULL, `size` TEXT, `brand` TEXT, `color` TEXT, `manufacturer` TEXT, `purchasePrice` INTEGER NOT NULL, `sellPrice` INTEGER NOT NULL, `categoryId` INTEGER NOT NULL, `totalQuantity` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Warehouse` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `address` TEXT NOT NULL, `createdAt` TEXT NOT NULL, `totalInventories` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  InventoryDao get inventoryDao {
    return _inventoryDaoInstance ??= _$InventoryDao(database, changeListener);
  }

  @override
  WarehouseDao get warehouseDao {
    return _warehouseDaoInstance ??= _$WarehouseDao(database, changeListener);
  }
}

class _$InventoryDao extends InventoryDao {
  _$InventoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _inventoryInsertionAdapter = InsertionAdapter(
            database,
            'Inventory',
            (Inventory item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'createdAt': item.createdAt,
                  'barcode': item.barcode,
                  'size': item.size,
                  'brand': item.brand,
                  'color': item.color,
                  'manufacturer': item.manufacturer,
                  'purchasePrice': item.purchasePrice,
                  'sellPrice': item.sellPrice,
                  'categoryId': item.categoryId,
                  'totalQuantity': item.totalQuantity
                },
            changeListener),
        _inventoryDeletionAdapter = DeletionAdapter(
            database,
            'Inventory',
            ['id'],
            (Inventory item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'createdAt': item.createdAt,
                  'barcode': item.barcode,
                  'size': item.size,
                  'brand': item.brand,
                  'color': item.color,
                  'manufacturer': item.manufacturer,
                  'purchasePrice': item.purchasePrice,
                  'sellPrice': item.sellPrice,
                  'categoryId': item.categoryId,
                  'totalQuantity': item.totalQuantity
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Inventory> _inventoryInsertionAdapter;

  final DeletionAdapter<Inventory> _inventoryDeletionAdapter;

  @override
  Stream<List<Inventory>> getAll() {
    return _queryAdapter.queryListStream('SELECT * FROM Inventory',
        mapper: (Map<String, Object?> row) => Inventory(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String,
            createdAt: row['createdAt'] as String,
            barcode: row['barcode'] as String,
            size: row['size'] as String?,
            brand: row['brand'] as String?,
            color: row['color'] as String?,
            manufacturer: row['manufacturer'] as String?,
            purchasePrice: row['purchasePrice'] as int,
            sellPrice: row['sellPrice'] as int,
            categoryId: row['categoryId'] as int,
            totalQuantity: row['totalQuantity'] as String),
        queryableName: 'Inventory',
        isView: false);
  }

  @override
  Stream<Inventory?> getOne(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Inventory WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Inventory(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String,
            createdAt: row['createdAt'] as String,
            barcode: row['barcode'] as String,
            size: row['size'] as String?,
            brand: row['brand'] as String?,
            color: row['color'] as String?,
            manufacturer: row['manufacturer'] as String?,
            purchasePrice: row['purchasePrice'] as int,
            sellPrice: row['sellPrice'] as int,
            categoryId: row['categoryId'] as int,
            totalQuantity: row['totalQuantity'] as String),
        arguments: [id],
        queryableName: 'Inventory',
        isView: false);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Inventory');
  }

  @override
  Future<void> insertOne(Inventory inventory) async {
    await _inventoryInsertionAdapter.insert(
        inventory, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAll(List<Inventory> inventories) async {
    await _inventoryInsertionAdapter.insertList(
        inventories, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteOne(Inventory inventory) async {
    await _inventoryDeletionAdapter.delete(inventory);
  }

  @override
  Future<void> replaceAll(List<Inventory> inventories) async {
    if (database is sqflite.Transaction) {
      await super.replaceAll(inventories);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.inventoryDao.replaceAll(inventories);
      });
    }
  }
}

class _$WarehouseDao extends WarehouseDao {
  _$WarehouseDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _warehouseInsertionAdapter = InsertionAdapter(
            database,
            'Warehouse',
            (Warehouse item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'address': item.address,
                  'createdAt': item.createdAt,
                  'totalInventories': item.totalInventories
                },
            changeListener),
        _warehouseDeletionAdapter = DeletionAdapter(
            database,
            'Warehouse',
            ['id'],
            (Warehouse item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'address': item.address,
                  'createdAt': item.createdAt,
                  'totalInventories': item.totalInventories
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Warehouse> _warehouseInsertionAdapter;

  final DeletionAdapter<Warehouse> _warehouseDeletionAdapter;

  @override
  Stream<List<Warehouse>> getAll() {
    return _queryAdapter.queryListStream('SELECT * FROM Warehouse',
        mapper: (Map<String, Object?> row) => Warehouse(
            id: row['id'] as int,
            name: row['name'] as String,
            address: row['address'] as String,
            createdAt: row['createdAt'] as String,
            totalInventories: row['totalInventories'] as String?),
        queryableName: 'Warehouse',
        isView: false);
  }

  @override
  Stream<Warehouse?> getOne(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Warehouse WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Warehouse(
            id: row['id'] as int,
            name: row['name'] as String,
            address: row['address'] as String,
            createdAt: row['createdAt'] as String,
            totalInventories: row['totalInventories'] as String?),
        arguments: [id],
        queryableName: 'Warehouse',
        isView: false);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Warehouse');
  }

  @override
  Future<void> insertOne(Warehouse warehouse) async {
    await _warehouseInsertionAdapter.insert(
        warehouse, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertAll(List<Warehouse> warehouses) async {
    await _warehouseInsertionAdapter.insertList(
        warehouses, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteOne(Warehouse warehouse) async {
    await _warehouseDeletionAdapter.delete(warehouse);
  }

  @override
  Future<void> replaceAll(List<Warehouse> warehouses) async {
    if (database is sqflite.Transaction) {
      await super.replaceAll(warehouses);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.warehouseDao.replaceAll(warehouses);
      });
    }
  }
}
