import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/data_provider/api_service.dart';
import 'package:inventory_tracker/data/data_provider/database_service.dart';
import 'package:inventory_tracker/data/dto/transaction.dto.dart';
import 'package:inventory_tracker/domain/entity/transaction.dart';

abstract class ITransactionRepository {
  @protected
  late final ApiService apiService;
  @protected
  late final DatabaseService databaseService;

  ITransactionRepository(this.apiService, this.databaseService);

  Stream<Resource<List<Transaction>>> fetchTransactions();

  Stream<Resource<Transaction?>> fetchTransaction(int id);

  Stream<Resource<Transaction>> updateTransaction(int id, TransactionDto data);

  Stream<Resource> deleteTransaction(int id);

  Stream<Resource<Transaction>> addTransaction(TransactionDto inventoryDto);
}
