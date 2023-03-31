import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/utils/common.dart';
import 'package:inventory_tracker/core/widgets/custom_dropdown.dart';
import 'package:inventory_tracker/domain/controllers/inventory_controller.dart';
import 'package:inventory_tracker/domain/form_inputs/form_validators.dart';
import 'package:inventory_tracker/presentation/screens/auth/widgets/FormField.dart';

class AddInventory extends StatefulWidget {
  const AddInventory({Key? key}) : super(key: key);

  @override
  State<AddInventory> createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventory> {
  final _formKey = GlobalKey<FormState>();

  final inventoryC = InventoryController.c;

  List<String> choices = [
    "shop A",
    "shop B",
    "shop C",
    "shop D",
    "shop E",
    "shop F"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Inventory"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => inventoryC.pickImage(context),
                    child: Container(
                      height: 120,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border.all(width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4))),
                      child: const Text("Image"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomFormField(
                      label: 'Item Name',
                      hasBorder: false,
                      controller: inventoryC.itemName,
                      onChange: (value) {
                        if (inventoryC.hasError) {
                          inventoryC.setError = "";
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) return null;
                        return inventoryC.formValidation(
                            FormFieldType.name, value);
                      }),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormField(
                            label: 'Barcode',
                            hasBorder: false,
                            controller: inventoryC.barcode,
                            onChange: (value) {
                              if (inventoryC.hasError) {
                                inventoryC.setError = "";
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) return null;
                              return inventoryC.formValidation(
                                  FormFieldType.email, value);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: IconButton(
                            onPressed: () => inventoryC.scanBarcode(),
                            icon: const Icon(Icons.qr_code_scanner)),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomFormField(
                    label: 'Purchase Price',
                    hasBorder: false,
                    controller: inventoryC.purchasePrice,
                    inputType: const TextInputType.numberWithOptions(),
                    validator: (value) {
                      if (value == null || value.isEmpty) return null;
                      return inventoryC.formValidation(
                          FormFieldType.password, value);
                    },
                    onChange: (value) {
                      if (inventoryC.hasError) {
                        inventoryC.setError = "";
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomFormField(
                    label: 'Sell Price',
                    hasBorder: false,
                    controller: inventoryC.sellPrice,
                    inputType: const TextInputType.numberWithOptions(),
                    validator: (value) {
                      if (value == null || value.isEmpty) return null;
                      return inventoryC.formValidation(
                          FormFieldType.password, value);
                    },
                    onChange: (value) {
                      if (inventoryC.hasError) {
                        inventoryC.setError = "";
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomFormField(
                    label: 'Quantity',
                    hasBorder: false,
                    controller: inventoryC.quantity,
                    inputType: const TextInputType.numberWithOptions(),
                    validator: (value) {
                      if (value == null || value.isEmpty) return null;
                      return inventoryC.formValidation(
                          FormFieldType.password, value);
                    },
                    onChange: (value) {
                      if (inventoryC.hasError) {
                        inventoryC.setError = "";
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomDropDown<String>(
                      label: "Shops",
                      choices: choices,
                      isExpanded: true,
                      onSelected: (val) => {print("Selected $val")}),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: widthQuery(context, 80),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Add"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
