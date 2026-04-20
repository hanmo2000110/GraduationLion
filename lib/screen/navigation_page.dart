import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduationlion/controller/navigation_controller.dart';
import 'package:graduationlion/core/constants/app_colors.dart';
import 'package:graduationlion/screen/home.dart';
import 'package:graduationlion/screen/mypage.dart';
import 'package:graduationlion/screen/recommend.dart';

class NavigationPage extends GetView<NavigationController> {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          switch (Navigation.values[controller.currentIndex.value]) {
            case Navigation.home:
              return const HomePage();
            case Navigation.recommend:
              return const RecommendPage();
            case Navigation.mypage:
              return const MyPage();
          }
        }),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: AppColors.navBackground,
            selectedItemColor: Colors.white,
            unselectedItemColor: AppColors.inactive,
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0.0,
            iconSize: 24,
            onTap: controller.changeIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.thumb_up),
                label: 'RECOMMEND',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'USER',
              ),
            ],
          ),
        ));
  }
}
