import 'package:get/get.dart';

import 'package:graduationlion/screen/InitPage/init_page.dart';
import 'package:graduationlion/screen/add_course.dart';
import 'package:graduationlion/screen/home_category_course.dart';
import 'package:graduationlion/screen/home.dart';
import 'package:graduationlion/screen/login.dart';
import 'package:graduationlion/screen/mypage.dart';
import 'package:graduationlion/screen/navigation_page.dart';
import 'package:graduationlion/screen/recommend.dart';
import 'package:graduationlion/screen/splash.dart';
import 'package:graduationlion/route/routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.init,
      page: () => const InitPage(),
    ),
    GetPage(
      name: Routes.navigation,
      page: () => const NavigationPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.recommend,
      page: () => const RecommendPage(),
    ),
    GetPage(
      name: Routes.mypage,
      page: () => const MyPage(),
    ),
    GetPage(
      name: Routes.addcourse,
      page: () => const AddCoursePage(),
    ),
    GetPage(
      name: Routes.homeCategoryCourse,
      page: () => const HomeCategoryCourse(),
    ),
  ];
}
