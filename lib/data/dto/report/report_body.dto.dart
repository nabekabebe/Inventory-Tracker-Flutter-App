import 'package:inventory_tracker/data/dto/transaction.dto.dart';
import 'package:inventory_tracker/data/dto/warehouse.dto.dart';

class ReportBodyDto {
  ReportBodyDto({
    this.id,
    this.createdAt,
    this.quantity,
    this.userId,
    this.inventory,
    this.warehouse,
    this.committedBy,
  });

  ReportBodyDto.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['created_at'];
    quantity = json['quantity'];
    userId = json['user_id'];
    inventory = json['inventory'] != null
        ? ReportInventory.fromJson(json['inventory'])
        : null;
    warehouse = json['warehouse'] != null
        ? WarehouseDto.fromJson(json['warehouse'])
        : null;
    committedBy = json['committed_by'] != null
        ? CommittedBy.fromJson(json['committed_by'])
        : null;
  }

  int? id;
  String? createdAt;
  int? quantity;
  int? userId;
  ReportInventory? inventory;
  WarehouseDto? warehouse;
  CommittedBy? committedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created_at'] = createdAt;
    map['quantity'] = quantity;
    map['user_id'] = userId;
    if (inventory != null) {
      map['inventory'] = inventory?.toJson();
    }
    if (warehouse != null) {
      map['warehouse'] = warehouse?.toJson();
    }
    if (committedBy != null) {
      map['committed_by'] = committedBy?.toJson();
    }
    return map;
  }
}

class ReportInventory {
  ReportInventory({
    int? id,
    String? sellPrice,
  }) {
    _id = id;
    _sellPrice = sellPrice;
  }

  ReportInventory.fromJson(dynamic json) {
    _id = json['id'];
    _sellPrice = json['sell_price'];
  }

  int? _id;
  String? _sellPrice;

  int? get id => _id;

  String? get sellPrice => _sellPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sell_price'] = _sellPrice;
    return map;
  }
}
