import 'package:dwi_selo_girimas/resources/theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? color;
  final Color? colorText;

  const ButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.color,
      this.colorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color ?? MyColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // foreground
      ),
      child: Text(buttonText,
          style: MyTextStyles.body1.copyWith(
            color: colorText ?? MyColors.backgroundColor,
          )),
    );
  }
}
