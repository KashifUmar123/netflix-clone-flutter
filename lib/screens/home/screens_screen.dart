import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/constants/app_colors.dart';
import 'package:netflix/constants/app_indicators.dart';
import 'package:netflix/screens/home/dashboard/navigation_screen.dart';

import '../../constants/app_images.dart';

class ScreensScreen extends StatefulWidget {
  const ScreensScreen({Key? key}) : super(key: key);

  @override
  State<ScreensScreen> createState() => _ScreensScreenState();
}

class _ScreensScreenState extends State<ScreensScreen> {
  int selectedScreen = 1;
  late TextEditingController pinController;

  @override
  void initState() {
    pinController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 24,
                  ),
                  Image.asset(
                    AppImages.netflixLogo,
                    height: Get.height * 0.04,
                    fit: BoxFit.cover,
                  ),
                  Icon(
                    Icons.edit,
                    color: AppColors.kWhiteColor.withOpacity(.8),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              const Text(
                "Who's Watching?",
                style: TextStyle(
                  color: AppColors.kWhiteColor,
                  fontSize: 17.0,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    localScreen(
                      name: "Screen 1",
                      color: Colors.greenAccent,
                      value: 1,
                    ),
                    localScreen(
                      name: "Screen 2",
                      color: Colors.redAccent,
                      value: 2,
                    ),
                    localScreen(
                      name: "Screen 3",
                      color: Colors.blueAccent,
                      value: 3,
                    ),
                    localScreen(
                      name: "Screen 4",
                      color: Colors.yellowAccent,
                      value: 4,
                    ),
                    localScreen(
                      name: "Screen 5",
                      color: Colors.orangeAccent,
                      value: 5,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding localScreen({
    required String name,
    required Color color,
    required int value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedScreen = value;
          });
          Get.dialog(
            Center(
              child: Container(
                height: Get.height * 0.19,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Material(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      const Text(
                        "Enter your pin to access this profile",
                        style: TextStyle(
                          color: AppColors.kBlackColor,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                        width: Get.width * 0.1,
                        child: TextField(
                          onChanged: ((value) async {
                            if (value.length == 4) {
                              Get.dialog(AppIndicators.circularIndicator,
                                  barrierColor:
                                      AppColors.kBlackColor.withOpacity(.9));
                              Timer(
                                const Duration(seconds: 2),
                                () => Get.offAll(
                                  () => const NavigationScreen(),
                                ),
                              );
                            }
                          }),
                          maxLength: 4,
                          cursorColor: AppColors.kGreyColor,
                          controller: pinController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            counterText: "",
                            hintText: "  ----",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: AppColors.kGreyColor,
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            child: const Padding(
                              padding: EdgeInsets.only(right: 30.0),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                  color: AppColors.kBlackColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            barrierColor: AppColors.kBlackColor.withOpacity(.8),
            barrierDismissible: false,
          );
        },
        child: SizedBox(
          height: Get.height * 0.2,
          width: Get.width * 0.28,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: Get.width * 0.28,
                height: Get.width * 0.28,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.emoji_emotions_outlined,
                    color: AppColors.kWhiteColor,
                    size: Get.height * 0.1,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Text(
                name,
                style: TextStyle(
                  color: AppColors.kWhiteColor.withOpacity(.9),
                  fontSize: 13.0,
                ),
              ),
              SizedBox(
                height: Get.height * 0.005,
              ),
              Icon(
                Icons.lock,
                color: AppColors.kGreyColor,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
