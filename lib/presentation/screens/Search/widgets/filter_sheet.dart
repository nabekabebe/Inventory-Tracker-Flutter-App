import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/widgets/custom_dropdown.dart';

enum ItemStatus { sold, refunded, available }

class FilterSheet extends StatefulWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  final GlobalKey expansionTileKey = GlobalKey();
  final ScrollController controller = ScrollController();

  void _scrollToSelectedContent({required GlobalKey expansionTileKey}) {
    final keyContext = expansionTileKey.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(keyContext,
          duration: Duration(milliseconds: 200));
    }
  }

  final List<String> sortOptions = ["SortBy", "Price", "Latest", "Oldest"];

  Map<String, dynamic> filterOptionsDefault = {
    'category': 'boots',
    'status': ItemStatus.sold.name,
    'price': const RangeValues(10, 800),
    'quantity': const RangeValues(10, 800),
    'brand': 'brand',
    'sortBy': "SortBy"
  };

  Map<String, dynamic> filterOptions = {
    'category': 'boots',
    'status': ItemStatus.sold.name,
    'price': const RangeValues(10, 800),
    'quantity': const RangeValues(10, 800),
    'brand': 'brand',
    'sortBy': "SortBy"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
              const SizedBox(
                width: 12,
              ),
              const Text("Filter"),
              Expanded(child: Container()),
              CustomDropDown<String>(
                  label: filterOptions['sortBy'],
                  choices: sortOptions,
                  isExpanded: false,
                  onSelected: (val) {
                    setState(() {
                      filterOptions['sortBy'] = val;
                    });
                  }),
            ],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                ExpansionTile(
                  title: const Text("Category"),
                  subtitle: Text(filterOptions['category']!),
                  backgroundColor: Colors.grey[100],
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: CustomDropDown<String>(
                          label: "Shops",
                          choices: const ["Shops", "Bots"],
                          isExpanded: true,
                          onSelected: (val) {
                            setState(() {
                              filterOptions['category'] = val;
                            });
                          }),
                    )
                  ],
                ),
                ExpansionTile(
                  title: const Text("Item Status"),
                  subtitle: Text(filterOptions['status']!),
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                                toggleable: true,
                                value: ItemStatus.sold.name,
                                groupValue: filterOptions['status']!,
                                onChanged: (v) {
                                  setState(() {
                                    filterOptions['status'] =
                                        ItemStatus.sold.name;
                                  });
                                }),
                            Text(ItemStatus.sold.name)
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                                toggleable: true,
                                value: ItemStatus.refunded.name,
                                groupValue: filterOptions['status']!,
                                onChanged: (v) {
                                  setState(() {
                                    filterOptions['status'] =
                                        ItemStatus.refunded.name;
                                  });
                                }),
                            Text(ItemStatus.refunded.name)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                ExpansionTile(
                  title: const Text("Brand"),
                  subtitle: Text(filterOptions['brand']!),
                  backgroundColor: Colors.grey[100],
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      child: TextField(
                        decoration: const InputDecoration(
                            hintText: "Write brand here..."),
                        onChanged: (val) {
                          setState(() {
                            filterOptions['brand'] = val;
                          });
                        },
                      ),
                    )
                  ],
                ),
                ExpansionTile(
                  title: const Text("Quantity"),
                  backgroundColor: Colors.grey[100],
                  subtitle: Text(
                      "from: ${(filterOptions['quantity']! as RangeValues).start.toInt()}\t\t\tto: ${(filterOptions['quantity']! as RangeValues).end.toInt()}"),
                  children: [
                    RangeSlider(
                      min: 10.0,
                      max: 1000.0,
                      values: filterOptions['quantity']! as RangeValues,
                      onChanged: (values) {
                        setState(() {
                          filterOptions['quantity'] = values;
                        });
                      },
                    )
                  ],
                ),
                ExpansionTile(
                  title: const Text("Price Range"),
                  backgroundColor: Colors.grey[100],
                  subtitle: Text(
                      "min: ${(filterOptions['price']! as RangeValues).start.toInt()} ETB\t\t\tmax: ${(filterOptions['price']! as RangeValues).end.toInt()} ETB"),
                  children: [
                    RangeSlider(
                      min: 10.0,
                      max: 1000.0,
                      values: filterOptions['price']! as RangeValues,
                      onChanged: (values) {
                        setState(() {
                          filterOptions['price'] = values;
                        });
                      },
                    )
                  ],
                  onExpansionChanged: (value) {
                    if (value) {
                      _scrollToSelectedContent(
                          expansionTileKey: expansionTileKey);
                    }
                  },
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          filterOptions = filterOptionsDefault;
                        });
                      },
                      child: const Text("Reset"))),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 3,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Apply"))),
            ],
          )
        ],
      ),
    );
  }
}
