import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduationlion/core/constants/app_colors.dart';
import 'package:graduationlion/route/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.toNamed(Routes.navigation);
      } else {
        Get.toNamed(Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Container(
          width: 250,
          height: 302,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/logo.png"), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
