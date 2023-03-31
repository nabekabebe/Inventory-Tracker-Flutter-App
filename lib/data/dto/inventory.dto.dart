import 'package:inventory_tracker/data/dto/inventory_store.dto.dart';
import 'package:inventory_tracker/domain/entity/inventory.dart';

import 'inventory_category.dto.dart';

class InventoryDto {
  InventoryDto({
    required this.id,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.barcode,
    required this.size,
    required this.brand,
    required this.color,
    required this.manufacturer,
    required this.purchasePrice,
    required this.sellPrice,
    required this.categoryId,
    required this.totalQuantity,
    this.category,
    this.stores,
  });

  InventoryDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    barcode = json['barcode'];
    size = json['size'];
    brand = json['brand'];
    color = json['color'];
    manufacturer = json['manufacturer'];
    purchasePrice = json['purchase_price'];
    sellPrice = json['sell_price'];
    categoryId = json['category_id'];
    totalQuantity = json['total_quantity'];
    category = InventoryCategoryDto.fromJson(json['category']);
    if (json['stores'] != null) {
      stores = [];
      json['stores'].forEach((v) {
        stores?.add(InventoryStores.fromJson(v));
      });
    }
  }

  late final int id;
  late final String name;
  late final String description;
  late final String createdAt;
  late final String barcode;
  late final String size;
  late final String brand;
  late final String color;
  late final String manufacturer;
  late final int purchasePrice;
  late final int sellPrice;
  late final int categoryId;
  late final String totalQuantity;
  late final InventoryCategoryDto? category;
  late final List<InventoryStores>? stores;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['created_at'] = createdAt;
    map['barcode'] = barcode;
    map['size'] = size;
    map['brand'] = brand;
    map['color'] = color;
    map['manufacturer'] = manufacturer;
    map['purchase_price'] = purchasePrice;
    map['sell_price'] = sellPrice;
    map['category_id'] = categoryId;
    map['total_quantity'] = totalQuantity;
    map['category'] = category?.toJson();
    map['stores'] = stores?.map((v) => v.toJson()).toList();
    return map;
  }

  Inventory toInventory() {
    return Inventory(
        id: id,
        name: name,
        barcode: barcode,
        description: description,
        createdAt: createdAt,
        size: size,
        sellPrice: sellPrice,
        brand: brand,
        color: color,
        manufacturer: manufacturer,
        purchasePrice: purchasePrice,
        totalQuantity: totalQuantity,
        categoryId: categoryId,
        category: category,
        stores: stores);
  }
}
