import 'package:graduationlion/controller/getxcontroller.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
  }
}
