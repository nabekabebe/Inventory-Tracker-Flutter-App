import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:inventory_tracker/core/exceptions/app_exception.dart';
import 'package:inventory_tracker/data/dto/warehouse.dto.dart';

class RemoteWarehouseProvider {
  final Dio client;

  RemoteWarehouseProvider(this.client);

  static const warehousesEndpoint = 'warehouses';

  Future<Either<AppException, List<WarehouseDto>>> fetchAllWarehouses(
      [Map<String, dynamic>? params]) async {
    try {
      final result =
          await client.get(warehousesEndpoint, queryParameters: params);
      return right((result.data['data'] as List)
          .map((item) => WarehouseDto.fromJson(item))
          .toList());
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, bool>> addWarehouse(
      [Map<String, dynamic>? data]) async {
    try {
      await client.post(warehousesEndpoint, data: data);
      return right(true);
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }
}
