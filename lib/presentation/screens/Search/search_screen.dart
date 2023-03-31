import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/common/routes.dart';
import 'package:inventory_tracker/core/utils/common.dart';
import 'package:inventory_tracker/domain/controllers/search_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  final searchC = SearchController.c;

  final choices = ["price", "date"];
  final choices2 = ["shop1", "shop2"];

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        currentIndex: 1,
        onTap: Routes.switchRoute,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_sharp),
            label: "Warehouse",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Statistics",
          ),
        ],
      ),
      floatingActionButton: Flow(
        delegate: FlowMenuDelegate(controller: controller, ctx: context),
        children: [
          FloatingActionButton(
            onPressed: () {
              controller.isCompleted
                  ? controller.reverse()
                  : controller.forward();
            },
            child: const Icon(
              Icons.access_alarm_outlined,
              color: Colors.white,
              size: 45.0,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              controller.isCompleted
                  ? controller.reverse()
                  : controller.forward();
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 45.0,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              controller.isCompleted
                  ? controller.reverse()
                  : controller.forward();
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
              size: 45.0,
            ),
          ),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final BuildContext ctx;

  FlowMenuDelegate({required this.controller, required this.ctx})
      : super(repaint: controller);

  final Animation<double> controller;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return controller != oldDelegate.controller;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount - 1; i++) {
      final radius = 100 * controller.value;
      final theta = i * pi * 0.5 / (context.childCount - 2);
      final x = radius * cos(theta);
      final y = radius * sin(theta);

      context.paintChild(i,
          transform: Matrix4.translationValues(
              widthQuery(ctx, 84) - x, heightQuery(ctx, 92) - y, 0));
    }

    context.paintChild(context.childCount - 1,
        transform: Matrix4.translationValues(
            widthQuery(ctx, 84), heightQuery(ctx, 92), 0));
  }
}
