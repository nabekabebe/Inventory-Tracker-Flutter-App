import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:inventory_tracker/core/exceptions/app_exception.dart';
import 'package:inventory_tracker/data/dto/InventorySellInfo.dart';
import 'package:inventory_tracker/data/dto/inventory.dto.dart';
import 'package:inventory_tracker/data/dto/inventory_update.dto.dart';
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

  Future<Either<AppException, InventoryDto>> fetchInventory(int id) async {
    try {
      final result = await client.get('$baseEndpoint/$id');
      return right((result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, Unit>> deleteInventory(int id) async {
    try {
      await client.delete('$baseEndpoint/$id');
      return right(unit);
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, InventoryDto>> storeInventory(
      InventoryDto data) async {
    try {
      final result = await client.post(baseEndpoint);
      //TODO: what if status code is different than 200?
      return right((result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, InventoryDto>> updateInventory(
      int id, InventoryUpdate data) async {
    try {
      final result = await client.patch('$baseEndpoint/$id', data: data);
      return right((result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, Unit>> sellInventory(
      int id, InventorySellInfoDto sellInfo) async {
    try {
      await client.post('$baseEndpoint/$id/sell', data: sellInfo);
      return right(unit);
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, Unit>> refundInventory(
      int id, int transactionId) async {
    try {
      await client.post('$baseEndpoint/$id/refund/$transactionId');
      return right(unit);
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, List<InventoryStockInfo>>> fetchLowStock(
      [Map<String, dynamic>? params]) async {
    try {
      final result =
          await client.get(lowStockEndpoint, queryParameters: params);
      return right((result.data['data'] as List)
          .map((item) => InventoryStockInfo.fromJson(item))
          .toList());
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }
}
