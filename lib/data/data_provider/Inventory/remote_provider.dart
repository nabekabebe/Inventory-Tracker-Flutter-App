import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:inventory_tracker/core/exceptions/app_exception.dart';
import 'package:inventory_tracker/data/dto/inventory.dto.dart';
import 'package:inventory_tracker/data/dto/stock_info.dto.dart';

class RemoteInventoryProvider {
  final Dio client;

  RemoteInventoryProvider(this.client);

  static const baseEndpoint = 'inventories';
  static const lowStockEndpoint = '$baseEndpoint/low';

  Future<Either<AppException, List<InventoryDto>>> fetchAllInventories(
      [Map<String, dynamic>? params]) async {
    try {
      final result = await client.get(baseEndpoint, queryParameters: params);
      return right((result.data['data'] as List)
          .map((item) => InventoryDto.fromJson(item))
          .toList());
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, List<StockInfo>>> fetchLowStock(
      [Map<String, dynamic>? params]) async {
    try {
      final result =
          await client.get(lowStockEndpoint, queryParameters: params);
      return right((result.data['data'] as List)
          .map((item) => StockInfo.fromJson(item))
          .toList());
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }
}
