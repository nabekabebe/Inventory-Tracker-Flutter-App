class InventoryVariationDto {
  InventoryVariationDto(
      {required this.id,
      required this.quantity,
      required this.size,
      required this.color});

  InventoryVariationDto.fromJson(dynamic json) {
    id = json['id'];
    size = json['size'];
    color = json['color'];
    quantity = json['quantity'];
  }

  late final int id;
  late final String size;
  late final String color;
  late final int quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['size'] = size;
    map['color'] = color;
    map['quantity'] = quantity;
    return map;
  }
}
