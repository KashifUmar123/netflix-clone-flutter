import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/constants/app_colors.dart';
import 'package:netflix/routes/app_routes.dart';
import 'package:netflix/routes/route_names.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      theme: ThemeData(
        primaryColor: AppColors.kBlackColor,
        backgroundColor: AppColors.kBlackColor,
      ),
      getPages: pages,
    );
  }
}
