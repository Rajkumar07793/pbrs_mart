import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pbrs_mart/controllers/screens_controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  // Instantiate the controller using Get.put() for dependency injection
  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/ic_prbs_3.png', width: 200),
      ),
    );
  }
}
