import 'package:dartz/dartz.dart';
import 'package:inventory_tracker/core/exceptions/app_exception.dart';
import 'package:inventory_tracker/core/utils/resource.dart';

Stream<Resource<ResultType>> networkBoundResource<ResultType, RequestType>(
    Stream<ResultType> Function() query,
    Future<Either<AppException, RequestType>> Function() fetch,
    Function(RequestType fetchResult) saveFetchedResult,
    Future<bool> Function(ResultType queryResult) shouldFetch) async* {
  final data = await query().first;
  Stream<Resource<ResultType>> result;

  if (await shouldFetch(data)) {
    // yield Resource<ResultType>.Loading(data);
    yield Resource.Loading(data);

    final res = await fetch();
    result = res.fold(
        (error) => query().map((item) => Resource.Error(error.message, item)),
        (data) {
      saveFetchedResult(data);
      return query().map((item) => Resource.Success(item));
    });
  } else {
    result = query().map((item) => Resource.Success(item));
  }

  yield* result;
}

Stream<Resource<ResultType>> networkRequest<RequestType, ResultType>(
    Future<Either<AppException, RequestType>> Function() fetch,
    ResultType Function(RequestType fetchResult) transformResult,
    Function(ResultType transformedData) saveFetchedResult) async* {
  Resource<ResultType> result;

  yield const Resource.Loading(null);

  final res = await fetch();
  result = res.fold((error) => Resource.Error(error.message, null), (data) {
    saveFetchedResult(transformResult(data));
    return Resource.Success(transformResult(data));
  });

  yield result;
}
