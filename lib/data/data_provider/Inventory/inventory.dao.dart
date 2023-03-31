import 'package:floor/floor.dart';
import 'package:inventory_tracker/domain/entity/inventory.dart';

@dao
abstract class InventoryDao {
  @Query("SELECT * FROM Inventory")
  Stream<List<Inventory>> getAll();

  @Query('SELECT * FROM Inventory WHERE id = :id')
  Stream<Inventory?> getOne(int id);

  @insert
  Future<void> insertOne(Inventory inventory);

  @insert
  Future<void> insertAll(List<Inventory> inventories);

  @delete
  Future<void> deleteOne(Inventory inventory);

  @Query("DELETE FROM Inventory")
  Future<void> deleteAll();

  @transaction
  Future<void> replaceAll(List<Inventory> inventories) =>
      Future.wait([deleteAll(), insertAll(inventories)]);
}
