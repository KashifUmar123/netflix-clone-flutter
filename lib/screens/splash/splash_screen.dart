import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/constants/app_colors.dart';
import 'package:netflix/constants/app_images.dart';
import 'package:netflix/routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      Get.offAllNamed(AppRoutes.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Image.asset(
            AppImages.netflixLogo,
          ),
        ),
      ),
    );
  }
}
