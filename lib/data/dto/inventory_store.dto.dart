class InventoryStores {
  InventoryStores({
    required this.id,
    this.createdAt,
    this.updatedAt,
    required this.quantity,
    required this.warehouseId,
    required this.inventoryId,});

  InventoryStores.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    quantity = json['quantity'];
    warehouseId = json['warehouse_id'];
    inventoryId = json['inventory_id'];
  }

  late final int id;
  late final String? createdAt;
  late final String? updatedAt;
  late final int quantity;
  late final int warehouseId;
  late final int inventoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['quantity'] = quantity;
    map['warehouse_id'] = warehouseId;
    map['inventory_id'] = inventoryId;
    return map;
  }

}