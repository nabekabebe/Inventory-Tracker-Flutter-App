import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:inventory_tracker/core/exceptions/app_exception.dart';
import 'package:inventory_tracker/data/dto/transfer.dto.dart';

class RemoteTransferProvider {
  final Dio client;

  RemoteTransferProvider(this.client);

  static const baseEndpoint = 'transfers';

  Future<Either<AppException, List<TransferDto>>> fetchAllTransfers(
      [Map<String, dynamic>? params]) async {
    try {
      final result = await client.get(baseEndpoint, queryParameters: params);
      return right((result.data['data'] as List)
          .map((item) => TransferDto.fromJson(item))
          .toList());
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, TransferDto>> fetchTransfer(int id) async {
    try {
      final result = await client.get('$baseEndpoint/$id');
      return right((result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, Unit>> deleteTransfer(int id) async {
    try {
      await client.delete('$baseEndpoint/$id');
      return right(unit);
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, TransferDto>> storeTransfer(
      TransferDto data) async {
    try {
      final result = await client.post(baseEndpoint);
      //TODO: what if status code is different than 200?
      return right((result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, TransferDto>> updateTransfer(
      int id, TransferDto data) async {
    try {
      final result = await client.patch('$baseEndpoint/$id', data: data);
      return right((result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }
}
