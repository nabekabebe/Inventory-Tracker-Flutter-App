import 'package:floor/floor.dart';
import 'package:inventory_tracker/domain/entity/inventory.dart';

@dao
abstract class InventoryDao {
  @Query("SELECT * FROM Inventory")
  Stream<List<Inventory>> getAll();

  @Query('SELECT * FROM Inventory WHERE id = :id')
  Stream<Inventory?> getOne(int id);

  @insert
  Future<int> insertOne(Inventory inventory);

  @insert
  Future<List<int>> insertAll(List<Inventory> inventories);

  @Query('DELETE FROM Inventory WHERE id=:id')
  Future<void> deleteOne(int id);

  @Query("DELETE FROM Inventory")
  Future<void> deleteAll();

  @transaction
  Future<void> replaceAll(List<Inventory> inventories) =>
      Future.wait([deleteAll(), insertAll(inventories)]);

  @transaction
  Future<void> replace(Inventory inventory) =>
      Future.wait([deleteOne(inventory.id), insertOne(inventory)]);
}
