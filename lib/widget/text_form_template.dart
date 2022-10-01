import 'package:dwi_selo_girimas/resources/theme.dart';
import 'package:flutter/material.dart';

class TextFormTemplate extends StatelessWidget {
  const TextFormTemplate(
      {Key? key,
      this.suffix,
      required this.label,
      required this.controller,
      this.prefix,
      this.isPassword,
      this.typeKeyboard})
      : super(key: key);
  final Widget? suffix;
  final Widget? prefix;
  final String label;
  final bool? isPassword;
  final TextEditingController controller;
  final TextInputType? typeKeyboard;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: typeKeyboard,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        prefix: prefix,
        suffix: suffix,
        focusColor: MyColors.primaryColor,
        hoverColor: MyColors.primaryColor,
        fillColor: MyColors.backgroundColor,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: MyColors.greyColor,
          ),
        ),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(7),
          ),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: MyColors.primaryColor,
          ),
        ),
        labelText: label,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'inputan tidak boleh kosong';
        }
        return null;
      },
    );
  }
}
