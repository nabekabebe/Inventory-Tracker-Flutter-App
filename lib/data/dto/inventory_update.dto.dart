import 'package:inventory_tracker/data/dto/variation.dto.dart';

class InventoryUpdate {
  InventoryUpdate(
      {this.quantity,
      this.warehouseId,
      this.inventoryId,
      this.variationDto,
      this.name,
      this.sellPrice,
      this.purchasePrice,
      this.barcode,
      this.manufacturer,
      this.description});

  final String? name;
  final String? description;
  final String? barcode;
  final int? purchasePrice;
  late final String? manufacturer;
  final int? sellPrice;
  final int? quantity;
  final int? warehouseId;
  final int? inventoryId;
  final InventoryVariationDto? variationDto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quantity'] = quantity;
    map['warehouse_id'] = warehouseId;
    map['inventory_id'] = inventoryId;
    map['name'] = name;
    map['description'] = description;
    map['barcode'] = barcode;
    map['variation'] = variationDto;
    map['manufacturer'] = manufacturer;
    map['purchase_price'] = purchasePrice;
    map['sell_price'] = sellPrice;
    return map;
  }
}
