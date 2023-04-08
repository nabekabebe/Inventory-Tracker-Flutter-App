import 'package:dio/dio.dart';
import 'package:inventory_tracker/data/data_provider/Auth/remote_provider.dart';
import 'package:inventory_tracker/data/data_provider/Inventory/remote_provider.dart';
import 'package:inventory_tracker/data/data_provider/transaction/remote_provider.dart';
import 'package:inventory_tracker/data/data_provider/transfer/remote_provider.dart';
import 'package:inventory_tracker/data/data_provider/warehouse/remote_provider.dart';

class ApiService {
  late final RemoteAuthProvider _authProvider;
  late final RemoteInventoryProvider _remoteInventoryProvider;
  late final RemoteWarehouseProvider _remoteWarehouseProvider;
  late final RemoteTransactionProvider _remoteTransactionProvider;
  late final RemoteTransferProvider _remoteTransferProvider;

  ApiService(Dio client) {
    _authProvider = RemoteAuthProvider(client);
    _remoteInventoryProvider = RemoteInventoryProvider(client);
    _remoteWarehouseProvider = RemoteWarehouseProvider(client);
  }

  RemoteAuthProvider get auth => _authProvider;

  RemoteInventoryProvider get inventory => _remoteInventoryProvider;

  RemoteWarehouseProvider get warehouse => _remoteWarehouseProvider;

  RemoteTransactionProvider get transaction => _remoteTransactionProvider;

  RemoteTransferProvider get transfer => _remoteTransferProvider;
}
