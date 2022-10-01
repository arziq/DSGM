import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/theme.dart';

SnackbarController showSnackbar(title, message, color) {
  return Get.snackbar(
    title,
    message,
    backgroundColor: color,
    instantInit: true,
    messageText: Text(message,
        style: const TextStyle(color: MyColors.primaryColor, fontSize: 16)),
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 1),
  );
}
