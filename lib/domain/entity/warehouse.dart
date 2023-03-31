import 'package:floor/floor.dart';
import 'package:inventory_tracker/domain/entity/base.dart';

@entity
class Warehouse extends BaseEntity {
  @primaryKey
  final int id;
  final String name;
  final String address;
  final String createdAt;
  final String? totalInventories;

  Warehouse({
    required this.id,
    required this.name,
    required this.address,
    required this.createdAt,
    this.totalInventories,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['address'] = address;
    map['created_at'] = createdAt;
    map['total_inventories'] = totalInventories;
    return map;
  }
}
