import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mallshop/Screens/auth_ui/welcome_screen.dart';
import 'package:mallshop/Screens/user_panel/main_screen.dart';
import 'package:mallshop/Utils/app_constant.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      // For Opening New Screen we use Get .ofAll when we use Get package
     Get.offAll(()=> WelcomeScreen());
    },);
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.statusBarColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.statusBarColor,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Lottie.asset('assets/splash_icon.json'),
                      )),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        AppConstant.appMainName,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Text(
                      AppConstant.appPoweredBy,
                      style: const TextStyle(
                          fontSize: 11.0, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
