import 'package:floor/floor.dart';
import 'package:inventory_tracker/domain/entity/warehouse.dart';

@dao
abstract class WarehouseDao {
  @Query("SELECT * FROM Warehouse")
  Stream<List<Warehouse>> getAll();

  @Query('SELECT * FROM Warehouse WHERE id = :id')
  Stream<Warehouse?> getOne(int id);

  @insert
  Future<void> insertOne(Warehouse warehouse);

  @insert
  Future<void> insertAll(List<Warehouse> warehouses);

  @delete
  Future<void> deleteOne(Warehouse warehouse);

  @Query("DELETE FROM Warehouse")
  Future<void> deleteAll();

  @transaction
  Future<void> replaceAll(List<Warehouse> warehouses) =>
      Future.wait([deleteAll(), insertAll(warehouses)]);
}
