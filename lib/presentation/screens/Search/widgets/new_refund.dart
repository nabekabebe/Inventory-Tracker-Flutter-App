import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/widgets/custom_dropdown.dart';
import 'package:inventory_tracker/domain/controllers/search_controller.dart';

class AddRefund extends StatefulWidget {
  const AddRefund({Key? key}) : super(key: key);

  @override
  State<AddRefund> createState() => _AddRefundState();
}

class _AddRefundState extends State<AddRefund> {
  final searchC = SearchController.c;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Issue Refund",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomDropDown<String>(
            label: "Choose Transaction",
            choices: const ["Transaction 1", "Transaction 2", "Transaction 3"],
            isExpanded: true,
            onSelected: (val) {
              setState(() {
                searchC.transaction.value = val;
              });
            }),
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
                searchC.refundItem();
              },
              child: const Text("REFUND"),
            ),
          ],
        )
      ],
    );
  }
}
