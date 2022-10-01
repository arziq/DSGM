import 'package:dwi_selo_girimas/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'resources/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      supportedLocales: [
        Locale('en', 'ID'),
      ],
      title: Strings.appTitle,
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
