import 'package:floor/floor.dart';
import 'package:inventory_tracker/domain/entity/warehouse.dart';

@dao
abstract class WarehouseDao {
  @Query("SELECT * FROM Warehouse")
  Stream<List<Warehouse>> getAll();

  @Query('SELECT * FROM Warehouse WHERE id = :id')
  Stream<Warehouse?> getOne(int id);

  @insert
  Future<int> insertOne(Warehouse warehouse);

  @insert
  Future<List<int>> insertAll(List<Warehouse> warehouses);

  @Query('DELETE FROM Warehouse WHERE id=:id')
  Future<void> deleteOne(int id);

  @Query("DELETE FROM Warehouse")
  Future<void> deleteAll();

  @transaction
  Future<void> replaceAll(List<Warehouse> warehouses) =>
      Future.wait([deleteAll(), insertAll(warehouses)]);

  @transaction
  Future<void> replace(Warehouse warehouse) =>
      Future.wait([deleteOne(warehouse.id), insertOne(warehouse)]);
}
