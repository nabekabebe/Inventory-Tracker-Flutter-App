import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/core/utils/common.dart';
import 'package:inventory_tracker/core/utils/form_validation_mixin.dart';
import 'package:inventory_tracker/data/dto/warehouse.dto.dart';
import 'package:inventory_tracker/domain/controllers/base_controller.dart';
import 'package:inventory_tracker/domain/entity/warehouse.dart';
import 'package:inventory_tracker/domain/repository/IWarehouseRepository.dart';
import 'package:inventory_tracker/presentation/screens/warehouse/widgets/add_warehouse.dart';

class WarehouseController extends BaseController<Warehouse>
    with FormValidationMixin {
  static WarehouseController get c => Get.find<WarehouseController>();

  final warehouseRepository = Get.find<IWarehouseRepository>(tag: 'ware');

  final name = TextEditingController();
  final address = TextEditingController();
  final addLoading = false.obs;

  fetchWarehouses() {
    warehouseRepository.fetchWarehouses().forEach((result) {
      result.when(Success: (allWarehouses) {
        loading.value = false;
        dataList.value = allWarehouses;
      }, Loading: (allWarehouses) {
        loading.value = true;
        if (allWarehouses.isNotNull) {
          dataList.value = allWarehouses!;
        }
      }, Error: (error, allWarehouses) {
        loading.value = false;

        errorMessage.value = error;
        if (allWarehouses.isNotNull) {
          dataList.value = allWarehouses!;
        }
      });
    });
  }

  addWarehouse() {
    final data = WarehouseAddDto(name: name.text, address: address.text);
    warehouseRepository.addWarehouse(data).forEach((result) {
      result.when(
          Success: (done) {
            errorMessage.value = "";
            addLoading.value = false;
          },
          Loading: (done) => addLoading.value = done ?? true,
          Error: (err, done) {
            addLoading.value = false;
            errorMessage.value = err;
            Get.snackbar("Warehouse add failed!", err,
                snackPosition: SnackPosition.BOTTOM);
          });
    });

    fetchWarehouses();
  }

  Widget buildAddDialog(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Dialog(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AddWarehouse(
            onCancel: (ctx) {
              Navigator.pop(ctx);
            },
            onSubmit: (ctx) {
              Navigator.pop(ctx);
              addWarehouse();
            },
          ),
        ),
      ),
    );
  }

  @override
  void clearForm() {
    name.text = "";
    address.text = "";
  }
}
