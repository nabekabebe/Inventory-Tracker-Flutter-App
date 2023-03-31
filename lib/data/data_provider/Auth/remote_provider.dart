import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:inventory_tracker/core/exceptions/app_exception.dart';
import 'package:inventory_tracker/data/dto/auth_response.dto.dart';

class RemoteAuthProvider {
  final Dio client;

  RemoteAuthProvider(this.client);

  static const loginEndpoint = 'login';
  static const registerEndpoint = 'register';

  Future<Either<AppException, AuthResponse>> login(
      Map<String, dynamic> data) async {
    try {
      final result = await client.post(loginEndpoint, data: jsonEncode(data));
      return right(AuthResponse.fromJson(result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }

  Future<Either<AppException, AuthResponse>> signup(
      Map<String, dynamic> data) async {
    try {
      final result =
      await client.post(registerEndpoint, data: jsonEncode(data));
      return right(AuthResponse.fromJson(result.data['data']));
    } on DioError catch (e) {
      return left(const AppException.unknownError());
    }
  }
// Future<Either<AppException, AuthResponse>> signInWithGoogle() async {
//   try {
//     //logic here
//     return right(AuthResponse.fromJson(result.data['data']));
//   } on DioError catch (e) {
//     return left(const AppException.unknownError());
//   }
// }
}
