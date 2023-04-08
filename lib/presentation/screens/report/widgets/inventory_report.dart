import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/core/widgets/custom_dropdown.dart';
import 'package:inventory_tracker/data/data.dart';
import 'package:inventory_tracker/domain/controllers/report_controller.dart';
import 'package:inventory_tracker/presentation/screens/Home/widgets/BarChartWrapper.dart';

class InventoryReport extends StatefulWidget {
  const InventoryReport({Key? key}) : super(key: key);

  @override
  State<InventoryReport> createState() => _InventoryReportState();
}

class _InventoryReportState extends State<InventoryReport> {
  final ReportController reportC = ReportController.c;

  Map<String, String> reportStatus = {
    'revenue': "43k",
    'sold': '435',
    'refunded': '41'
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => BarChartWrapper(
              yLabel: "Revenue",
              aspectRatio: 1.6,
              data: reportC.selectedData,
              widthPercentage:
                  reportC.selectedType.value == DataType.monthly ? 200 : 94,
              actionWidget: CustomDropDown<String>(
                  label: DataType.annual.name.capitalizeFirst!,
                  choices: DataType.values
                      .map((e) => e.name.capitalizeFirst!)
                      .toList(),
                  onSelected: (val) {
                    for (var element in DataType.values) {
                      if (element.name.capitalizeFirst! == val) {
                        reportC.updateChart(element);
                      }
                    }
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text("Revenue"),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                      text: const TextSpan(
                          text: '+ ',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                          children: [
                        TextSpan(
                          text: "43k ",
                        ),
                        TextSpan(
                          text: "ETB",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ])),
                ],
              ),
              Column(
                children: const [
                  Text("Sold"),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "435",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              Column(
                children: const [
                  Text("Refunded"),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "467",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => Text("Most sold: ${reportC.selectedType.value.name}")),
              IconButton(
                  onPressed: () {},
                  icon: reportC.isSortReversed.value
                      ? const RotatedBox(
                          quarterTurns: 2,
                          child: Icon(Icons.sort),
                        )
                      : const Icon(Icons.sort))
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, idx) {
                final random = Random();
                final randomNumber = random.nextInt(9);
                return Card(
                  elevation: 0.5,
                  child: ListTile(
                    title: Text(names[randomNumber]),
                    subtitle: RichText(
                        text: TextSpan(
                            text: 'Sold\t\t',
                            style: const TextStyle(color: Colors.black),
                            children: [
                          TextSpan(
                              text: (randomNumber + 5).toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ])),
                    trailing: RichText(
                      text: TextSpan(
                          text: '+ ',
                          style: const TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: "$randomNumber.4k ",
                            ),
                            const TextSpan(
                              text: "ETB",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
