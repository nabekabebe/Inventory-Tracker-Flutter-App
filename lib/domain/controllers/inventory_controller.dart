import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_tracker/core/utils/form_validation_mixin.dart';
import 'package:inventory_tracker/domain/controllers/base_controller.dart';
import 'package:inventory_tracker/domain/entity/inventory.dart';

class InventoryController extends BaseController<Inventory>
    with FormValidationMixin {
  static InventoryController get c => Get.find<InventoryController>();

  final itemName = TextEditingController();
  final barcode = TextEditingController();
  final purchasePrice = TextEditingController();
  final sellPrice = TextEditingController();
  final quantity = TextEditingController();
  final shop = "".obs;

  ImageSource? source;

  void pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    Get.dialog(buildChoiceDialog(context));
    if (source == null) return;
    final XFile? image = await picker.pickImage(source: source!);
  }

  void scanBarcode() async {
    barcode.text = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", false, ScanMode.BARCODE);
  }

  Widget buildChoiceDialog(BuildContext context) {
    return GestureDetector(
      onTap: () => source = null,
      child: Dialog(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                source = ImageSource.camera;
                Navigator.pop(context);
              },
              child: const Text("Camera"),
            ),
            ElevatedButton(
              onPressed: () {
                source = ImageSource.gallery;
                Navigator.pop(context);
              },
              child: const Text("Gallery"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void clearForm() {
    itemName.text = "";
    barcode.text = "";
    purchasePrice.text = "";
    sellPrice.text = "";
    quantity.text = "";
    shop.value = "";
  }
}
