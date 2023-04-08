import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/utils/common.dart';
import 'package:inventory_tracker/core/widgets/custom_dropdown.dart';
import 'package:inventory_tracker/domain/controllers/warehouse_controller.dart';
import 'package:inventory_tracker/domain/form_inputs/form_validators.dart';
import 'package:inventory_tracker/presentation/screens/auth/widgets/FormField.dart';

class CreateTransfer extends StatefulWidget {
  const CreateTransfer({Key? key}) : super(key: key);

  @override
  State<CreateTransfer> createState() => _CreateTransferState();
}

class _CreateTransferState extends State<CreateTransfer> {
  final wareC = WarehouseController.c;
  final _formKey = GlobalKey<FormState>();

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
        title: const Text("Create Transfer"),
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
                  const Align(
                      alignment: Alignment.centerLeft, child: Text("Shops")),
                  const SizedBox(height: 20),
                  CustomDropDown<String>(
                      label: "From",
                      choices: choices,
                      isExpanded: true,
                      onSelected: (val) => {print("Selected $val")}),
                  CustomDropDown<String>(
                      label: "To",
                      choices: choices,
                      isExpanded: true,
                      onSelected: (val) => {print("Selected $val")}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Items"),
                      ElevatedButton(onPressed: () {}, child: const Text("ADD"))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: CustomFormField(
                            label: 'Inventory',
                            hasBorder: false,
                            controller: wareC.name,
                            onChange: (value) {
                              if (wareC.hasError) {
                                wareC.setError = "";
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) return null;
                              return wareC.formValidation(
                                  FormFieldType.name, value);
                            }),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 2,
                        child: CustomFormField(
                            label: 'Quantity',
                            hasBorder: false,
                            controller: wareC.name,
                            onChange: (value) {
                              if (wareC.hasError) {
                                wareC.setError = "";
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) return null;
                              return wareC.formValidation(
                                  FormFieldType.name, value);
                            }),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
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
