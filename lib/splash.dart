import 'package:dwi_selo_girimas/home.dart';
import 'package:dwi_selo_girimas/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'controller/home_controller.dart';
import 'resources/strings.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);
  final HomeController _home = Get.put(HomeController());
  Future<void> initializeSettings() async {
    await _home.showData();
    await _home.showCategory();
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        } else {
          if (snapshot.hasError) {
            return errorView(snapshot);
          } else {
            return HomePage();
          }
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: SplashView(),
      duration: 3000,
      text: "DSGM",
      imageSrc: ImagePath.logo,
      textType: TextType.NormalText,
      textStyle: const TextStyle(
        fontSize: 30.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
