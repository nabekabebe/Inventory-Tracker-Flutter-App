import 'package:inventory_tracker/data/dto/transaction.dto.dart';
import 'package:inventory_tracker/data/dto/warehouse.dto.dart';

class Transaction {
  Transaction({
    required this.id,
    required this.quantity,
    required this.createdAt,
    required this.comment,
    required this.paymentMethod,
    required this.isActive,
    required this.transactionType,
    required this.userId,
    required this.inventory,
    required this.warehouse,
    required this.committedBy,
  }) {
    id = id;
    quantity = quantity;
    createdAt = createdAt;
    comment = comment;
    paymentMethod = paymentMethod;
    isActive = isActive;
    transactionType = transactionType;
    userId = userId;
    inventory = inventory;
    warehouse = warehouse;
    committedBy = committedBy;
  }

  late final int id;
  late final int quantity;
  late final String createdAt;
  late final String comment;
  late final String paymentMethod;
  late final int isActive;
  late final String transactionType;
  late final int userId;
  late final TransactionInventory inventory;
  late final WarehouseDto warehouse;
  late final CommittedBy committedBy;
}
