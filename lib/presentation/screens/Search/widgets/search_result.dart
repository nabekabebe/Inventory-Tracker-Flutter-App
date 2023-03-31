import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/domain/controllers/search_controller.dart';

enum MenuType { sell, refund }

class SearchItem extends StatelessWidget {
  SearchItem({Key? key}) : super(key: key);

  final searchC = SearchController.c;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        trailing: PopupMenuButton<MenuType>(
          onSelected: (val) {
            searchC.clearForm();
            if (val == MenuType.sell) {
              Get.dialog(searchC.buildSellDialog(context));
            } else {
              Get.dialog(searchC.buildRefundDialog(context));
            }
          },
          padding: const EdgeInsets.all(12),
          itemBuilder: (BuildContext ctx) {
            return <PopupMenuEntry<MenuType>>[
              PopupMenuItem<MenuType>(
                value: MenuType.sell,
                child: Row(children: [
                  const Icon(Icons.monetization_on_outlined),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(MenuType.sell.name)
                ]),
              ),
              PopupMenuItem<MenuType>(
                value: MenuType.refund,
                child: Row(children: [
                  const Icon(Icons.replay_circle_filled_rounded),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(MenuType.refund.name)
                ]),
              ),
            ];
          },
          child: Icon(Icons.adaptive.more),
        ),
        contentPadding: const EdgeInsets.all(8),
        leading: AspectRatio(
            aspectRatio: 1.6,
            child: Image.asset("assets/icons/inventory_launcher.png")),
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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Barcode No", style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(
              height: 16,
            ),
            const Text("Bole (Warehouse)"),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Price\t\t",
                        style: const TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: "400 ",
                          style: TextStyle(color: Colors.red[400])),
                      const TextSpan(
                          text: "ETB", style: TextStyle(color: Colors.black)),
                    ])),
                RichText(
                    text: TextSpan(
                        text: "Quantity\t\t",
                        style: const TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: "400",
                          style: TextStyle(color: Colors.red[400])),
                    ])),
              ],
            ),
          ],
        ),
        style: ListTileStyle.drawer,
      ),
    );
  }
}
