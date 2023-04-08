import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:inventory_tracker/core/exceptions/app_exception.dart';
import 'package:inventory_tracker/data/dto/stock_info.dto.dart';
import 'package:inventory_tracker/data/dto/warehouse.dto.dart';

class RemoteWarehouseProvider {
  final Dio client;

  RemoteWarehouseProvider(this.client);

  static const warehousesEndpoint = 'warehouses';
  static const lowStockEndpoint = 'warehouses/low';

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

  Future<Either<AppException, WarehouseDto>> fetchWarehouse(int id,
      [Map<String, dynamic>? params]) async {
    try {
      final result =
          await client.get('$warehousesEndpoint/$id', queryParameters: params);
      return right(result.data['data'] as WarehouseDto);
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, List<WarehouseStockInfo>>> fetchLowInShop(
      [Map<String, dynamic>? params]) async {
    try {
      final result =
          await client.get(lowStockEndpoint, queryParameters: params);
      return right((result.data['data'] as List)
          .map((item) => WarehouseStockInfo.fromJson(item))
          .toList());
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, Unit>> deleteWarehouse(int id) async {
    try {
      await client.delete('$warehousesEndpoint/$id');
      return right(unit);
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, WarehouseDto>> storeWarehouse(
      WarehouseAddDto data) async {
    try {
      final result = await client.post(warehousesEndpoint, data: data);
      //TODO: what if status code is different than 200?
      return right((result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, WarehouseDto>> updateWarehouse(
      int id, WarehouseAddDto data) async {
    try {
      final result = await client.patch('$warehousesEndpoint/$id', data: data);
      return right(result.data['data'] as WarehouseDto);
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }
}
