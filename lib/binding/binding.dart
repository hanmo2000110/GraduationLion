import 'package:graduationlion/controller/getxcontroller.dart';
import 'package:get/get.dart';

import '../controller/coursecontroller.dart';
import '../controller/recommendController.dart';
import '../controller/requirementController.dart';
import '../controller/userController.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController());
    Get.put(CourseController());
    Get.put(UserController());
    Get.put(RequirementController());
    Get.put(RecommendController());
  }
}
