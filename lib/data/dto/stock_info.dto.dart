class StockInfo {
  StockInfo({
    required this.id,
    required this.name,
    required this.brand,
    required this.totalQuantity,});

  StockInfo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    brand = json['brand'];
    totalQuantity = json['total_quantity'];
  }

  late final int id;
  late final String name;
  late final String brand;
  late final String totalQuantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['brand'] = brand;
    map['total_quantity'] = totalQuantity;
    return map;
  }

}