import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.text,
    required this.controller,
    this.isObscure = false,
    this.inputType = TextInputType.text,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextEditingController controller;
  final bool isObscure;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kLightGrey.withOpacity(.9),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: SizedBox(
          height: Get.height * 0.05,
          child: TextField(
            controller: controller,
            obscureText: isObscure,
            style: TextStyle(color: AppColors.kWhiteColor.withOpacity(.8)),
            cursorColor: AppColors.kWhiteColor.withOpacity(.8),
            decoration: InputDecoration(
              label: Text(text),
              fillColor: Colors.transparent,
              filled: true,
              focusColor: AppColors.kGreyColor,
              hintStyle: TextStyle(
                color: AppColors.kGreyColor,
              ),
              labelStyle: TextStyle(
                color: AppColors.kWhiteColor.withOpacity(.8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
