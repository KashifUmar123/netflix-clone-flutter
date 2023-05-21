import 'package:flutter/material.dart';
import 'package:netflix/constants/app_colors.dart';
import 'package:netflix/screens/home/dashboard/home/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;

  List screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  List<BottomNavigationBarItem> navigationItems = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_esports,
      ),
      label: "Games",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.ondemand_video,
      ),
      label: "New & Hot",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.emoji_emotions_outlined,
      ),
      label: "Fast Laughs",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.download_for_offline_outlined,
      ),
      label: "Downloads",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0XFF151515),
        selectedItemColor: AppColors.kWhiteColor.withOpacity(.8),
        unselectedItemColor: AppColors.kGreyColor,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: navigationItems,
        currentIndex: currentIndex,
        onTap: handleNavigationChange,
      ),
    );
  }

  handleNavigationChange(value) => setState(() {
        currentIndex = value;
      });
}
