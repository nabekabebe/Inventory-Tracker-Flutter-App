import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/utils/common.dart';

class StatusCard extends StatelessWidget {
  final String label;
  final int amount;
  final String? message;

  const StatusCard(
      {Key? key, required this.label, required this.amount, this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: widthQuery(context, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "< ${amount.toString()}",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(message ?? "< $amount items left",
                  style: Theme.of(context).textTheme.labelMedium)
            ],
          ),
        ),
      ),
    );
  }
}
