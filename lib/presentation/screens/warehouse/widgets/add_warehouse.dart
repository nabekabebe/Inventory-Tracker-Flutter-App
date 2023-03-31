import 'package:flutter/material.dart';
import 'package:inventory_tracker/domain/controllers/warehouse_controller.dart';
import 'package:inventory_tracker/domain/form_inputs/form_validators.dart';
import 'package:inventory_tracker/presentation/screens/auth/widgets/FormField.dart';

class AddWarehouse extends StatelessWidget {
  final Function(BuildContext)? onSubmit;
  final Function(BuildContext)? onCancel;

  AddWarehouse({Key? key, this.onSubmit, this.onCancel}) : super(key: key);

  final wareC = WarehouseController.c;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Warehouse",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFormField(
                label: 'Name',
                controller: wareC.name,
                onChange: (value) {
                  if (wareC.hasError) {
                    wareC.setError = "";
                  }
                },
                validator: (value) {
                  return wareC.formValidation(FormFieldType.name, value);
                }),
            const SizedBox(height: 16),
            CustomFormField(
              label: 'Address',
              obscure: true,
              controller: wareC.address,
              postIcon: Icons.location_on_outlined,
              validator: (value) {},
              onChange: (value) {
                if (wareC.hasError) {
                  wareC.setError = "";
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (onCancel != null) {
                      onCancel!(context);
                    }
                  },
                  child: const Text("CANCEL"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && onSubmit != null) {
                      onSubmit!(context);
                    }
                  },
                  child: const Text("ADD"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
