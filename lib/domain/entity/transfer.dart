import 'package:inventory_tracker/data/dto/transfer.dto.dart';

class Transfer {
  Transfer({
    required this.id,
    required this.quantity,
    required this.createdAt,
    required this.inventoryId,
    required this.sourceId,
    required this.destinationId,
    required this.totalInventories,
    required this.from,
    required this.to,
  });

  Transfer.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    inventoryId = json['inventory_id'];
    sourceId = json['source_id'];
    destinationId = json['destination_id'];
    totalInventories = json['total_inventories'];
    from = TransferFrom.fromJson(json['from']);
    to = TransferTo.fromJson(json['to']);
  }

  late final int id;
  late final int quantity;
  late final String createdAt;
  late final int inventoryId;
  late final int sourceId;
  late final int destinationId;
  late final int totalInventories;
  late final TransferFrom from;
  late final TransferTo to;
}
