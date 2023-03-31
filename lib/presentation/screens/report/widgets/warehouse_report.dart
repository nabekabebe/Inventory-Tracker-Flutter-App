import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/core/widgets/custom_dropdown.dart';
import 'package:inventory_tracker/domain/controllers/report_controller.dart';
import 'package:inventory_tracker/presentation/screens/Home/widgets/BarChartWrapper.dart';

class WarehouseReport extends StatefulWidget {
  const WarehouseReport({Key? key}) : super(key: key);

  @override
  State<WarehouseReport> createState() => _WarehouseReportState();
}

class _WarehouseReportState extends State<WarehouseReport> {
  final ReportController reportC = ReportController.c;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                return Card(
                  elevation: 0.5,
                  child: ListTile(
                    title: const Text("Timberland"),
                    subtitle: RichText(
                        text: const TextSpan(
                            text: 'Sold\t\t',
                            style: TextStyle(color: Colors.black),
                            children: [
                          TextSpan(
                              text: "400",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ])),
                    trailing: RichText(
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
