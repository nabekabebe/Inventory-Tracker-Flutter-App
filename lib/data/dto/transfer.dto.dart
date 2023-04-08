import 'package:inventory_tracker/domain/entity/transfer.dart';

class TransferDto {
  TransferDto({
    this.id,
    this.quantity,
    this.createdAt,
    this.inventoryId,
    this.sourceId,
    this.destinationId,
    this.totalInventories,
    this.from,
    this.to,
  });

  TransferDto.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    inventoryId = json['inventory_id'];
    sourceId = json['source_id'];
    destinationId = json['destination_id'];
    totalInventories = json['total_inventories'];
    from = json['from'] != null ? TransferFrom.fromJson(json['from']) : null;
    to = json['to'] != null ? TransferTo.fromJson(json['to']) : null;
  }

  int? id;
  int? quantity;
  String? createdAt;
  int? inventoryId;
  int? sourceId;
  int? destinationId;
  int? totalInventories;
  TransferFrom? from;
  TransferTo? to;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    map['created_at'] = createdAt;
    map['inventory_id'] = inventoryId;
    map['source_id'] = sourceId;
    map['destination_id'] = destinationId;
    map['total_inventories'] = totalInventories;
    if (from != null) {
      map['from'] = from?.toJson();
    }
    if (to != null) {
      map['to'] = to?.toJson();
    }
    return map;
  }

  Transfer toTransfer() {
    return Transfer(
        id: id!,
        quantity: quantity!,
        createdAt: createdAt!,
        inventoryId: inventoryId!,
        sourceId: sourceId!,
        destinationId: destinationId!,
        totalInventories: totalInventories!,
        from: from!,
        to: to!);
  }
}

class TransferTo {
  TransferTo({
    this.id,
    this.name,
  });

  TransferTo.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

class TransferFrom {
  TransferFrom({
    this.id,
    this.name,
  });

  TransferFrom.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
