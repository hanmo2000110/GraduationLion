import 'package:get/get.dart';

enum Navigation { home, recommend, mypage }

class NavigationController extends GetxService {
  static NavigationController get to => Get.find();
  RxInt currentIndex = 0.obs;

  // ignore: non_constant_identifier_names

  void changeIndex(int index) {
    currentIndex(index);
  }
}
