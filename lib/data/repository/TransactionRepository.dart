import 'package:inventory_tracker/core/utils/networkBoundResource.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/dto/transaction.dto.dart';
import 'package:inventory_tracker/domain/entity/transaction.dart';
import 'package:inventory_tracker/domain/repository/ITransactionRepository.dart';

class InventoryRepository extends ITransactionRepository {
  InventoryRepository(super.apiService, super.databaseService) : super();

  @override
  Stream<Resource<Transaction>> addTransaction(TransactionDto inventoryDto) =>
      networkRequest(
          () => apiService.transaction.storeTransaction(inventoryDto),
          (fetchResult) => fetchResult.toTransaction(),
          (transformedData) {});

  @override
  Stream<Resource> deleteTransaction(int id) => networkRequest(
      () => apiService.transaction.deleteTransaction(id),
      (fetchResult) => fetchResult,
      (transformedData) {});

  @override
  Stream<Resource<Transaction?>> fetchTransaction(int id) => networkRequest(
      () => apiService.transaction.fetchTransaction(id),
      (fetchResult) => fetchResult.toTransaction(),
      (transformedData) {});

  @override
  Stream<Resource<List<Transaction>>> fetchTransactions() => networkRequest(
      () => apiService.transaction.fetchAllTransactions(),
      (fetchResult) => fetchResult.map((e) => e.toTransaction()).toList(),
      (transformedData) {});

  @override
  Stream<Resource<Transaction>> updateTransaction(
          int id, TransactionDto data) =>
      networkRequest(() => apiService.transaction.updateTransaction(id, data),
          (fetchResult) => fetchResult.toTransaction(), (transformedData) {});
}
