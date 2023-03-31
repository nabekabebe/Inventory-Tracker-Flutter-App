import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/common/routes.dart';
import 'package:inventory_tracker/domain/controllers/report_controller.dart';
import 'package:inventory_tracker/presentation/screens/report/widgets/inventory_report.dart';
import 'package:inventory_tracker/presentation/screens/report/widgets/warehouse_report.dart';

enum ReportShare { excel }

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage>
    with SingleTickerProviderStateMixin {
  final ReportController reportC = ReportController.c;

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Inventory'),
    Tab(text: 'Warehouse'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.teal,
          showSelectedLabels: false,
          currentIndex: 3,
          onTap: Routes.switchRoute,
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
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: myTabs,
          ),
          title: const Text("Report"),
          actions: [
            PopupMenuButton(
                icon: const Icon(Icons.share),
                itemBuilder: (ctx) {
                  return <PopupMenuEntry<ReportShare>>[
                    PopupMenuItem(
                      child: const Text("Export to excel"),
                      onTap: () {
                        reportC.exportToExcel();
                      },
                    )
                  ];
                })
          ],
        ),
        body: TabBarView(
            controller: _tabController,
            children: const [InventoryReport(), WarehouseReport()]));
  }
}
