import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String? value) onChange;
  final String? Function(String? value) validator;
  final String label;
  final bool enabled;
  final bool obscure;
  final bool hasBorder;
  final TextInputType inputType;
  final IconData? preIcon;
  final IconData? postIcon;

  const CustomFormField(
      {Key? key,
      required this.label,
      required this.controller,
      required this.onChange,
      required this.validator,
      this.enabled = true,
      this.hasBorder = true,
      this.obscure = false,
      this.inputType = TextInputType.text,
      this.preIcon,
      this.postIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: hasBorder ? const OutlineInputBorder() : null,
          prefixIcon: preIcon != null ? Icon(preIcon) : null,
          suffixIcon: postIcon != null ? Icon(postIcon) : null),
      keyboardType: inputType,
      enabled: enabled,
      controller: controller,
      onChanged: onChange,
      validator: validator,
    );
  }
}
