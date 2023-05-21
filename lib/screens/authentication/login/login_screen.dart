import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/constants/app_colors.dart';
import 'package:netflix/constants/app_images.dart';
import 'package:netflix/routes/route_names.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool rememberMe = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              customAppbar(),
              SizedBox(
                height: Get.height * 0.3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                child: CustomTextfield(
                  controller: emailController,
                  text: "Email",
                  inputType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                child: CustomTextfield(
                  controller: passwordController,
                  text: "Password",
                  isObscure: true,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                child: CustomButton(
                  text: "Sign in",
                  onPress: () => Get.toNamed(AppRoutes.screens),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Need help?",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.kWhiteColor.withOpacity(.8),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "New to Netflix? Sign up now.",
                      style: TextStyle(
                        color: AppColors.kWhiteColor.withOpacity(.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: Get.width * 0.9,
                      child: AutoSizeText(
                        "Sign in is protexted by Google reCAPTCHA to ensure you're not a bot. Learn more.",
                        style: TextStyle(
                          color: AppColors.kWhiteColor.withOpacity(.6),
                          fontSize: 12.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customAppbar() {
    return Row(
      children: [
        SizedBox(
          width: Get.width * 0.05,
        ),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.kWhiteColor,
          ),
        ),
        SizedBox(
          width: Get.width * 0.01,
        ),
        Image.asset(
          AppImages.netflixLogo,
          height: Get.height * 0.04,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
