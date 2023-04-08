import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/domain/controllers/warehouse_controller.dart';

class WarehousePage extends StatefulWidget {
  const WarehousePage({Key? key}) : super(key: key);

  @override
  State<WarehousePage> createState() => _WarehousePageState();
}

class _WarehousePageState extends State<WarehousePage> {
  final wareC = WarehouseController.c;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warehouses"),
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (ctx, idx) {
            return Card(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bole Med",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "Jan 15, 2022",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.delete, size: 18),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.edit, size: 18)
                        ],
                      ),
                      RichText(
                          text: const TextSpan(
                              text: "Total\t\t",
                              style: TextStyle(color: Colors.black),
                              children: [
                            TextSpan(
                                text: "400",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold)),
                            WidgetSpan(
                                child: SizedBox(
                              width: 20,
                            )),
                            TextSpan(
                              text: "Sold\t\t",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "12",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ])),
                    ],
                  ),
                ),
                style: ListTileStyle.drawer,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (wareC.addLoading.value) return;
          wareC.clearForm();
          Get.dialog(wareC.buildAddDialog(context));
        },
        child: Obx(() => wareC.addLoading.value
            ? const CircularProgressIndicator()
            : const Icon(Icons.add)),
      ),
    );
  }
}
