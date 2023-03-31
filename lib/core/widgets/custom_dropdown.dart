import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatefulWidget {
  final String label;
  final List<T> choices;
  final bool hasUnderline;
  final bool isExpanded;
  final Function(T value) onSelected;

  const CustomDropDown(
      {Key? key,
      required this.label,
      required this.choices,
      required this.onSelected,
      this.hasUnderline = false,
      this.isExpanded = false})
      : super(key: key);

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  T? selected;

  Widget buildDropDown(Widget child) {
    return !widget.hasUnderline
        ? DropdownButtonHideUnderline(child: child)
        : child;
  }

  @override
  Widget build(BuildContext context) {
    return buildDropDown(DropdownButton2<T>(
      isExpanded: widget.isExpanded,
      isDense: !widget.isExpanded,
      hint: Text(
        widget.label,
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).hintColor,
        ),
      ),
      items: widget.choices
          .map((item) => DropdownMenuItem<T>(
                value: item,
                child: Text(
                  item.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      value: selected,
      onChanged: (value) {
        if (value == null) {
          return;
        }
        setState(() {
          selected = value;
        });
        widget.onSelected(value);
      },
      buttonStyleData: widget.isExpanded
          ? const ButtonStyleData(width: double.infinity)
          : null,
      menuItemStyleData: MenuItemStyleData(
          selectedMenuItemBuilder: (BuildContext ctx, Widget child) =>
              Container(
                color: Theme.of(context).primaryColor,
                child: child,
              )),
    ));
  }
}
