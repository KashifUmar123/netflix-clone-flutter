import 'package:flutter/material.dart';
import 'package:netflix/constants/app_colors.dart';

class AppIndicators {
  static const Widget circularIndicator = Center(
    child: CircularProgressIndicator(
      color: AppColors.kRedColor,
    ),
  );
}
