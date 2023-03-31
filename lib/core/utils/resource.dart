import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';

@freezed
class Resource<T> with _$Resource<T> {
  const factory Resource.Success(T data) = Success<T>;

  const factory Resource.Loading(T? data) = Loading<T>;

  const factory Resource.Error(String message, T? data) = Error<T>;
}
