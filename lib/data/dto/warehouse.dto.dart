import 'package:inventory_tracker/domain/entity/warehouse.dart';

class WarehouseDto {
  late final int id;
  late final String name;
  late final String address;
  late final String createdAt;
  late final String totalInventories;

  WarehouseDto({
    required this.id,
    required this.name,
    required this.address,
    required this.createdAt,
    required this.totalInventories,
  });

  WarehouseDto.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    createdAt = json['created_at'];
    totalInventories = json['total_inventories'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['address'] = address;
    map['created_at'] = createdAt;
    map['total_inventories'] = totalInventories;
    return map;
  }

  Warehouse toWarehouse() {
    return Warehouse(
        id: id,
        name: name,
        address: address,
        createdAt: createdAt,
        totalInventories: totalInventories);
  }
}

class WarehouseAddDto {
  final String name;
  final String address;

  WarehouseAddDto({
    required this.name,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['address'] = address;
    return map;
  }
}
