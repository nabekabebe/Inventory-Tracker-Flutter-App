import 'package:inventory_tracker/core/utils/networkBoundResource.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/dto/transfer.dto.dart';
import 'package:inventory_tracker/domain/entity/transfer.dart';
import 'package:inventory_tracker/domain/repository/ITransferRepository.dart';

class TransferRepository extends ITransferRepository {
  TransferRepository(super.apiService, super.databaseService) : super();

  @override
  Stream<Resource<Transfer>> addTransfer(TransferDto transferDto) =>
      networkRequest(() => apiService.transfer.storeTransfer(transferDto),
          (fetchResult) => fetchResult.toTransfer(), (transformedData) {});

  @override
  Stream<Resource> deleteTransfer(int id) => networkRequest(
      () => apiService.transfer.deleteTransfer(id),
      (fetchResult) => fetchResult,
      (transformedData) {});

  @override
  Stream<Resource<Transfer?>> fetchTransfer(int id) => networkRequest(
      () => apiService.transfer.fetchTransfer(id),
      (fetchResult) => fetchResult.toTransfer(),
      (transformedData) {});

  @override
  Stream<Resource<List<Transfer>>> fetchTransfers() => networkRequest(
      () => apiService.transfer.fetchAllTransfers(),
      (fetchResult) => fetchResult.map((e) => e.toTransfer()).toList(),
      (transformedData) {});

  @override
  Stream<Resource<Transfer>> updateTransfer(int id, TransferDto transferDto) =>
      networkRequest(() => apiService.transfer.updateTransfer(id, transferDto),
          (fetchResult) => fetchResult.toTransfer(), (transformedData) {});
}
