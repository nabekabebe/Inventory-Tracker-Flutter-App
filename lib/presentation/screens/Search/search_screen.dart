import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_tracker/core/common/routes.dart';
import 'package:inventory_tracker/domain/controllers/search_controller.dart';
import 'package:inventory_tracker/presentation/screens/Search/delegates/flow.delegate.dart';
import 'package:inventory_tracker/presentation/screens/Search/widgets/filter_sheet.dart';
import 'package:inventory_tracker/presentation/screens/Search/widgets/search_result.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

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
  late FloatingSearchBarController searchBarController;

  final searchLists = ["rabbit", "dog", "cat"];

  @override
  void initState() {
    super.initState();
    searchC.dataList.value = searchLists;
    searchBarController = FloatingSearchBarController();
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

  submitQuery(query) {
    searchBarController.query = query;
    searchC.queryText.value = query;
    searchBarController.close();
  }

  fabAction(String? route, [dynamic args]) {
    searchC.chosenIcon.value = !searchC.chosenIcon.value;
    controller.isCompleted ? controller.reverse() : null;
    if (route != null) {
      Get.toNamed(route, arguments: args);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Flow(
          delegate: FlowMenuDelegate(controller: controller, ctx: context),
          children: [
            FloatingActionButton(
              heroTag: "fab_1",
              elevation: 1,
              onPressed: () {
                fabAction(Routes.ADD_INVENTORY, {'isFromFile': true});
              },
              child: const Icon(
                Icons.file_copy_sharp,
                color: Colors.white,
              ),
            ),
            FloatingActionButton(
              heroTag: "fab_2",
              elevation: 1,
              onPressed: () {
                fabAction(Routes.ADD_INVENTORY);
              },
              child: const Icon(
                Icons.edit_note_sharp,
                color: Colors.white,
              ),
            ),
            FloatingActionButton(
              heroTag: "fab_3",
              onPressed: () {
                searchC.chosenIcon.value = !searchC.chosenIcon.value;
                controller.isCompleted
                    ? controller.reverse()
                    : controller.forward();
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Obx(
                  () => Icon(
                    searchC.chosenIcon.isTrue ? Icons.add : Icons.close,
                    key: ValueKey<bool>(searchC.chosenIcon.value),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(fit: StackFit.expand, children: [
            FloatingSearchBar(
                automaticallyImplyBackButton: false,
                controller: searchBarController,
                transitionCurve: Curves.easeInOut,
                physics: const BouncingScrollPhysics(),
                openAxisAlignment: 0.0,
                elevation: 2,
                title: Obx(() => Text(searchC.queryText.value)),
                leadingActions: [
                  CircularButton(
                      icon: const Icon(Icons.qr_code_scanner), onPressed: () {})
                ],
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 64,
                      ),
                      SearchItem(),
                      SearchItem(),
                      SearchItem(),
                      SearchItem(),
                      SearchItem(),
                      SearchItem(),
                      SearchItem(),
                      SearchItem(),
                      SearchItem(),
                    ],
                  ),
                ),
                onQueryChanged: (query) {
                  searchC.dataList.value = searchLists
                      .where((v) => v.toString().startsWith(query))
                      .toList();
                },
                onSubmitted: (query) {
                  submitQuery(query);
                },
                transition: SlideFadeFloatingSearchBarTransition(),
                actions: [
                  FloatingSearchBarAction.searchToClear(
                    showIfClosed: false,
                  ),
                  CircularButton(
                    icon: const Icon(Icons.tune),
                    onPressed: () => Get.bottomSheet(const FilterSheet()),
                  ),
                ],
                builder: (context, transition) {
                  return Card(
                    child: Obx(
                      () => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: searchC.dataList.map((value) {
                          return ListTile(
                            title: Text(value),
                            onTap: () {
                              submitQuery(value);
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }),
          ]),
        ));
  }
}
