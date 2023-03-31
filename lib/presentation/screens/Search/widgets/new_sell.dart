import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/widgets/custom_dropdown.dart';
import 'package:inventory_tracker/domain/controllers/search_controller.dart';
import 'package:inventory_tracker/presentation/screens/auth/widgets/FormField.dart';

class AddNewSell extends StatefulWidget {
  const AddNewSell({Key? key}) : super(key: key);

  @override
  State<AddNewSell> createState() => _AddNewSellState();
}

class _AddNewSellState extends State<AddNewSell> {
  final searchC = SearchController.c;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sell Item",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomDropDown<String>(
            label: "Payment Method",
            choices: [PaymentMethod.bank.name, PaymentMethod.cash.name],
            isExpanded: true,
            onSelected: (val) {
              setState(() {
                if (val == PaymentMethod.bank.name) {
                  searchC.paymentMethod.value = PaymentMethod.bank;
                } else {
                  searchC.paymentMethod.value = PaymentMethod.cash;
                }
              });
            }),
        const SizedBox(
          height: 20,
        ),
        CustomFormField(
            label: 'Comment',
            controller: searchC.comment,
            onChange: (value) {
              if (searchC.hasError) {
                searchC.setError = "";
              }
            },
            validator: (value) {}),
        const SizedBox(height: 16),
        Row(
          children: [
            const Text("Quantity"),
            Expanded(child: Container()),
            IconButton(
                onPressed: () {
                  if (searchC.quantity.value <= 0) return;
                  setState(() {
                    searchC.quantity.value -= 1;
                  });
                },
                icon: const Icon(Icons.remove)),
            const SizedBox(
              width: 14,
            ),
            Text(searchC.quantity.value.toString()),
            const SizedBox(
              width: 14,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    searchC.quantity.value += 1;
                  });
                },
                icon: const Icon(Icons.add))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("CANCEL"),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: () {
                searchC.sellItem();
              },
              child: const Text("ADD"),
            ),
          ],
        )
      ],
    );
  }
}
