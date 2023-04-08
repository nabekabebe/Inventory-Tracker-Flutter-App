import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:inventory_tracker/core/exceptions/app_exception.dart';
import 'package:inventory_tracker/data/dto/transaction.dto.dart';

class RemoteTransactionProvider {
  final Dio client;

  RemoteTransactionProvider(this.client);

  static const baseEndpoint = 'transactions';

  Future<Either<AppException, List<TransactionDto>>> fetchAllTransactions(
      [Map<String, dynamic>? params]) async {
    try {
      final result = await client.get(baseEndpoint, queryParameters: params);
      return right((result.data['data'] as List)
          .map((item) => TransactionDto.fromJson(item))
          .toList());
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, TransactionDto>> fetchTransaction(int id) async {
    try {
      final result = await client.get('$baseEndpoint/$id');
      return right((result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, Unit>> deleteTransaction(int id) async {
    try {
      await client.delete('$baseEndpoint/$id');
      return right(unit);
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, TransactionDto>> storeTransaction(
      TransactionDto data) async {
    try {
      final result = await client.post(baseEndpoint);
      //TODO: what if status code is different than 200?
      return right((result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, TransactionDto>> updateTransaction(
      int id, TransactionDto data) async {
    try {
      final result = await client.patch('$baseEndpoint/$id', data: data);
      return right((result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, Unit>> getReport(
      int id, TransactionReportRequest reportRequest) async {
    try {
      await client.get('$baseEndpoint/$id/sell', data: reportRequest);
      return right(unit);
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }
}
