import 'package:get/get.dart';

import 'package:graduationlion/controller/coursecontroller.dart';
import 'package:graduationlion/controller/getxcontroller.dart';
import 'package:graduationlion/controller/recommendController.dart';
import 'package:graduationlion/controller/requirementController.dart';
import 'package:graduationlion/controller/userController.dart';

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
