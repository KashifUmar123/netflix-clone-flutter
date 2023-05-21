import 'package:get/get.dart';
import 'package:netflix/routes/route_names.dart';
import 'package:netflix/screens/authentication/login/login_screen.dart';
import 'package:netflix/screens/home/screens_screen.dart';
import 'package:netflix/screens/splash/splash_screen.dart';

List<GetPage> pages = [
  GetPage(
    name: AppRoutes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.registration,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.screens,
    page: () => const ScreensScreen(),
  ),
];
