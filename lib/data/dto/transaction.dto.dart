import 'package:inventory_tracker/data/dto/warehouse.dto.dart';
import 'package:inventory_tracker/domain/entity/transaction.dart';

enum TransactionReportType { weekly, monthly, annual }

class TransactionReportRequest {
  final TransactionReportType reportType;
  final int year;
  final int month;
  final int week;

  TransactionReportRequest({required this.reportType,
    required this.year,
    required this.month,
    required this.week});
}

class TransactionDto {
  TransactionDto({
    int? id,
    int? quantity,
    String? createdAt,
    String? comment,
    String? paymentMethod,
    int? isActive,
    String? transactionType,
    int? userId,
    TransactionInventory? inventory,
    WarehouseDto? warehouse,
    CommittedBy? committedBy,
  }) {
    _id = id;
    _quantity = quantity;
    _createdAt = createdAt;
    _comment = comment;
    _paymentMethod = paymentMethod;
    _isActive = isActive;
    _transactionType = transactionType;
    _userId = userId;
    _inventory = inventory;
    _warehouse = warehouse;
    _committedBy = committedBy;
  }

  TransactionDto.fromJson(dynamic json) {
    _id = json['id'];
    _quantity = json['quantity'];
    _createdAt = json['created_at'];
    _comment = json['comment'];
    _paymentMethod = json['payment_method'];
    _isActive = json['is_active'];
    _transactionType = json['transaction_type'];
    _userId = json['user_id'];
    _inventory = json['inventory'] != null
        ? TransactionInventory.fromJson(json['inventory'])
        : null;
    _warehouse = json['warehouse'] != null
        ? WarehouseDto.fromJson(json['warehouse'])
        : null;
    _committedBy = json['committed_by'] != null
        ? CommittedBy.fromJson(json['committed_by'])
        : null;
  }

  int? _id;
  int? _quantity;
  String? _createdAt;
  String? _comment;
  String? _paymentMethod;
  int? _isActive;
  String? _transactionType;
  int? _userId;
  TransactionInventory? _inventory;
  WarehouseDto? _warehouse;
  CommittedBy? _committedBy;

  int? get id => _id;

  int? get quantity => _quantity;

  String? get createdAt => _createdAt;

  String? get comment => _comment;

  String? get paymentMethod => _paymentMethod;

  int? get isActive => _isActive;

  String? get transactionType => _transactionType;

  int? get userId => _userId;

  TransactionInventory? get inventory => _inventory;

  WarehouseDto? get warehouse => _warehouse;

  CommittedBy? get committedBy => _committedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['quantity'] = _quantity;
    map['created_at'] = _createdAt;
    map['comment'] = _comment;
    map['payment_method'] = _paymentMethod;
    map['is_active'] = _isActive;
    map['transaction_type'] = _transactionType;
    map['user_id'] = _userId;
    if (_inventory != null) {
      map['inventory'] = _inventory?.toJson();
    }
    if (_warehouse != null) {
      map['warehouse'] = _warehouse?.toJson();
    }
    if (_committedBy != null) {
      map['committed_by'] = _committedBy?.toJson();
    }
    return map;
  }

  Transaction toTransaction() {
    return Transaction(
        id: id!,
        quantity: quantity!,
        createdAt: createdAt!,
        comment: comment!,
        paymentMethod: paymentMethod!,
        isActive: isActive!,
        transactionType: transactionType!,
        userId: userId!,
        inventory: inventory!,
        warehouse: warehouse!,
        committedBy: committedBy!);
  }
}

class CommittedBy {
  CommittedBy({
    int? id,
    String? fullName,
  }) {
    _id = id;
    _fullName = fullName;
  }

  CommittedBy.fromJson(dynamic json) {
    _id = json['id'];
    _fullName = json['full_name'];
  }

  int? _id;
  String? _fullName;

  int? get id => _id;

  String? get fullName => _fullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['full_name'] = _fullName;
    return map;
  }
}

class TransactionInventory {
  TransactionInventory({
    int? id,
    String? name,
    int? sellPrice,
  }) {
    _id = id;
    _name = name;
    _sellPrice = sellPrice;
  }

  TransactionInventory.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _sellPrice = json['sell_price'];
  }

  int? _id;
  String? _name;
  int? _sellPrice;

  int? get id => _id;

  String? get name => _name;

  int? get sellPrice => _sellPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['sell_price'] = _sellPrice;
    return map;
  }
}
