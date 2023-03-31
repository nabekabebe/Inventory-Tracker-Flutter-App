import 'package:flutter/material.dart';

class SearchWithSuggestion extends StatefulWidget {
  final Function(String val) onChange;
  final List<String> suggestions;

  const SearchWithSuggestion(
      {Key? key, required this.suggestions, required this.onChange})
      : super(key: key);

  @override
  State<SearchWithSuggestion> createState() => _SearchWithSuggestionState();
}

class _SearchWithSuggestionState extends State<SearchWithSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        widget.onChange(textEditingValue.text);
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return widget.suggestions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },

      onSelected: (String selection) {
        widget.onChange(selection);
        debugPrint('You just selected $selection');
      },
    );
  }
}
