import 'package:graduationlion/screen/home.dart';
import 'package:graduationlion/screen/recommend.dart';
import 'package:graduationlion/screen/mypage.dart';
import 'package:graduationlion/screen/navigationPage.dart';

import 'package:get/get.dart';

part 'routes.dart';

class AppPages {
  static const initial = Routes.navigation;

  static final routes = [
    GetPage(
      name: Routes.navigation,
      page: () => const NavigationPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.recommned,
      page: () => const RecommendPage(),
    ),
    GetPage(
      name: Routes.mypage,
      page: () => const MyPage(),
    ),
  ];
}
