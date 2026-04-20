import 'package:get/get.dart';

import 'package:graduationlion/controller/course_controller.dart';
import 'package:graduationlion/controller/navigation_controller.dart';
import 'package:graduationlion/controller/recommend_controller.dart';
import 'package:graduationlion/controller/requirement_controller.dart';
import 'package:graduationlion/controller/user_controller.dart';

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
