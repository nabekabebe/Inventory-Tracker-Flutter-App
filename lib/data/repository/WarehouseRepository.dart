import 'package:inventory_tracker/core/utils/network.dart';
import 'package:inventory_tracker/core/utils/networkBoundResource.dart';
import 'package:inventory_tracker/core/utils/resource.dart';
import 'package:inventory_tracker/data/dto/warehouse.dto.dart';
import 'package:inventory_tracker/domain/entity/warehouse.dart';
import 'package:inventory_tracker/domain/repository/IWarehouseRepository.dart';

class WarehouseRepository extends IWarehouseRepository {
  WarehouseRepository(super.apiService, super.databaseService) : super();

  @override
  Stream<Resource<List<Warehouse>>> fetchWarehouses() => networkBoundResource(
          () => databaseService.warehouse.getWarehouses(),
          () => apiService.warehouse.fetchAllWarehouses(), (fetchResult) async {
        final warehouses =
            fetchResult.map((item) => item.toWarehouse()).toList();
        await databaseService.warehouse.replaceWarehouses(warehouses);
      }, (queryResult) async => await isNetworkConnected());

  @override
  Stream<Resource<bool>> addWarehouse(WarehouseAddDto warehouse) async* {
    yield const Resource.Loading(null);

    final result = await apiService.warehouse.addWarehouse(warehouse.toJson());
    yield result.fold((l) => Resource.Error(l.message, false),
        (r) => const Resource.Success(true));
  }
}
