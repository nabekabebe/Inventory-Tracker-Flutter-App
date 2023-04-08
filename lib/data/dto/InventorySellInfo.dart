class InventorySellInfoDto {
  InventorySellInfoDto(
      {required this.id,
      required this.comment,
      required this.quantity,
      required this.warehouseId,
      required this.paymentMethod});

  InventorySellInfoDto.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    warehouseId = json['warehouse_id'];
    paymentMethod = json['payment_method'];
    comment = json['comment'];
  }

  late final int id;
  late final int quantity;
  late final String warehouseId;
  late final String paymentMethod;
  late final int comment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    map['warehouse_id'] = warehouseId;
    map['payment_method'] = paymentMethod;
    map['comment'] = comment;
    return map;
  }
}
