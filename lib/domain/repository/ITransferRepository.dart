import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/data_provider/api_service.dart';
import 'package:inventory_tracker/data/data_provider/database_service.dart';
import 'package:inventory_tracker/data/dto/transfer.dto.dart';
import 'package:inventory_tracker/domain/entity/transfer.dart';

abstract class ITransferRepository {
  @protected
  late final ApiService apiService;
  @protected
  late final DatabaseService databaseService;

  ITransferRepository(this.apiService, this.databaseService);

  Stream<Resource<List<Transfer>>> fetchTransfers();

  Stream<Resource<Transfer?>> fetchTransfer(int id);

  Stream<Resource<Transfer>> updateTransfer(int id, TransferDto transferDto);

  Stream<Resource> deleteTransfer(int id);

  Stream<Resource<Transfer>> addTransfer(TransferDto transferDto);
}
