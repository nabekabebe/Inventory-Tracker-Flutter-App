import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchInputDelegate extends SearchDelegate {
  final List<Widget>? action;
  final List<Widget> results;

  static const Widget noResult = Padding(
    padding: EdgeInsets.only(top: 12.0),
    child: Center(child: Text("No Results.")),
  );

  SearchInputDelegate({required this.action, this.results = const [noResult]})
      : super();

  @override
  String get searchFieldLabel => 'Search...';

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = context.theme;
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(elevation: 0),
      textTheme: theme.textTheme.copyWith(
        titleLarge:
            theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.normal),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color:
              theme.colorScheme.onPrimary, // set your desired hint color here
        ),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return action;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Icon(Icons.search);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: results,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      children: [Text("result one"), Text("result two"), Text("result three")],
    );
  }
}
