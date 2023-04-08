import 'dart:io';

import 'package:excel/excel.dart' hide Border;
import 'package:file_picker/file_picker.dart';
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

  bool isFromFile = false;

  @override
  void onInit() {
    super.onInit();
    isFromFile = Get.arguments != null ? Get.arguments['isFromFile'] : false;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isFromFile) {
        Get.dialog(
            // barrierDismissible: false,
            buildFileChooser());
      }
    });
  }

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

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xls', 'xlsx'],
    );

    if (result != null) {
      var bytes = File(result.files.first.path!).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);
    } else {
      // User canceled the picker
    }
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

  Widget buildFileChooser() {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "eg. file.xls",
              style: TextStyle(color: Colors.grey[500], fontSize: 18.0),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // pickFile();
              },
              child: const Text("Choose File"),
            ),
            ExpansionTile(
              shape: const Border(),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 12),
              title: Text("See format hint",
                  style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              children: [
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et "
                    "finibus dolor. Curabitur viverra lectus eu sapien venenatis tempus. ",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12))
              ],
            )
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

  void submitForm() {
    Get.defaultDialog(
        content: const Text("Confirm inventory add"),
        onConfirm: () {
          addInventory();
        },
        onCancel: () {});
  }

  void addInventory() {}
}
