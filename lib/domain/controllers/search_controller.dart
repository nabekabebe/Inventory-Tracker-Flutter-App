import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/core/utils/form_validation_mixin.dart';
import 'package:inventory_tracker/domain/controllers/base_controller.dart';
import 'package:inventory_tracker/presentation/screens/Search/widgets/new_refund.dart';
import 'package:inventory_tracker/presentation/screens/Search/widgets/new_sell.dart';

enum PaymentMethod { bank, cash }

class SearchController extends BaseController with FormValidationMixin {
  static SearchController get c => Get.find<SearchController>();

  final queryText = "".obs;
  final focusNode = FocusNode();

  final scannedString = "".obs;
  final addLoading = false.obs;

  final comment = TextEditingController();
  final paymentMethod = PaymentMethod.bank.obs;
  final quantity = 0.obs;
  final sellLoading = false.obs;

  final transaction = "".obs;

  final chosenIcon = true.obs;

  void sellItem() {}

  void refundItem() {}

  void scanBarcode() async {
    queryText.value = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", false, ScanMode.BARCODE);
  }

  Widget buildSellDialog(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Dialog(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: AddNewSell(),
        ),
      ),
    );
  }

  Widget buildRefundDialog(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: const Dialog(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: AddRefund(),
        ),
      ),
    );
  }

  @override
  void clearForm() {
    comment.text = "";
    paymentMethod.value = PaymentMethod.bank;
    quantity.value = 0;
    transaction.value = "";
  }
}
