import 'package:floor/floor.dart';
import 'package:inventory_tracker/data/dto/inventory_category.dto.dart';
import 'package:inventory_tracker/data/dto/inventory_store.dto.dart';
import 'package:inventory_tracker/data/dto/variation.dto.dart';
import 'package:inventory_tracker/domain/entity/base.dart';

@entity
class Inventory extends BaseEntity {
  @primaryKey
  late final int id;
  late final String name;
  late final String description;
  late final String createdAt;
  late final String barcode;
  late final String? manufacturer;
  late final int purchasePrice;
  late final int sellPrice;
  late final int categoryId;
  late final String totalQuantity;
  @ignore
  late final InventoryVariationDto? variation;
  @ignore
  late final InventoryCategoryDto? category;
  @ignore
  late final List<InventoryStores>? stores;

  Inventory(
      {required this.id,
      required this.name,
      required this.description,
      required this.createdAt,
      required this.barcode,
      this.manufacturer,
      required this.purchasePrice,
      required this.sellPrice,
      required this.categoryId,
      required this.totalQuantity,
      this.category,
      this.stores,
      this.variation});
}
