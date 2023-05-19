import 'package:flutter/material.dart';
import 'home.dart';
import 'recommend.dart';
import 'mypage.dart';
import 'package:graduationlion/controller/getxcontroller.dart';
import 'package:get/get.dart';

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
            backgroundColor: const Color(0xff14171A),
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xff777777),
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
