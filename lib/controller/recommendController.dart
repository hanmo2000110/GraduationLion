import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:graduationlion/controller/coursecontroller.dart';
import 'package:graduationlion/controller/userController.dart';
// import 'package:graduationlion/controller/coursecontroller.dart';

class RecommendController extends GetxController {
  static RecommendController get to => Get.find();
  List willCourses = [];
  List<List> semesters = [[], [], [], [], [], [], [], []];

  Future<void> onInit() async {
    super.onInit();
    // loadRecommendCourses();
  }

  Future<void> loadRecommendCourses() async {
    final db = FirebaseFirestore.instance;
    Set<String> must = {};
    Set<String> select = {};

    for (int i = 1; i <= 8; i++) {
      var temp = await db
          .collection('Recommned')
          .doc(UserController.to.major)
          .collection('Courses')
          .doc('semester$i')
          .get();
      // if (i - 1 <= UserController.to.semester) {
      for (var course in (temp.data()!['must'] as List)) must.add(course);
      // }
      // if (i == UserController.to.semester + 1) {
      for (var course in (temp.data()!['select'] as List)) select.add(course);
      // }
      print("----------------- semester $i ----------------");
      // print(must);
      // print(select);
      // print("---------------------------------");

      // 이미 수강한 수업 제외
      for (var course in UserController.to.userCourses) {
        if (must.contains(course.name)) must.remove(course.name);
        if (select.contains(course.name)) select.remove(course.name);
      }

      // 수강예정 수업 제외
      for (var course in willCourses) {
        if (must == course) must.remove(course);
        if (select == course) select.remove(course);
      }

      // 실무 영어 패스 여부에 맞춰 더미 삭제
      if (UserController.to.englishGrade > 0) must.remove("English Foundation");
      if (UserController.to.englishGrade > 1)
        must.remove("English Comunication");
      if (UserController.to.englishGrade > 2)
        must.remove("English Reading and Discussion");

      // 간단한 선수 과목 처리 (공리훈, 채플, 사봉, 칼, 실무영어)
      int flag1 = 0;
      int flag2 = 0;
      int flag3 = 0;
      int flag4 = 0;
      int flag5 = 0;
      for (var course in must.toList()) {
        if (course.contains("사회봉사") && flag1 == 1) must.remove(course);
        if (course.contains("공동체 리더십 훈련") && flag2 == 1) must.remove(course);
        if (course.contains("채플") && flag3 == 1) must.remove(course);
        if (course.contains("Calculus") && flag4 == 1) must.remove(course);
        if ((course.contains("English ") || course == "EAP") && flag5 == 1)
          must.remove(course);

        if (course.contains("사회봉사") && flag1 == 0) flag1 = 1;
        if (course.contains("공동체 리더십 훈련") && flag2 == 0) flag2 = 1;
        if (course.contains("채플") && flag3 == 0) flag3 = 1;
        if ((course.contains("Calculus") || course == "EAP") && flag4 == 0)
          flag4 = 1;
      }

      int count = 0;
      while (must.length != 0 && count < 10 && i > UserController.to.semester) {
        semesters[i - 1].add(must.first);
        willCourses.add(must.first);
        must.remove(must.first);
        count++;
      }
      while (
          count < 10 && select.length != 0 && i > UserController.to.semester) {
        semesters[i - 1].add(select.first);
        willCourses.add(select.first);
        select.remove(select.first);
        count++;
      }
      select.clear();

      // print(must);
      // print(select);
      print(semesters[i - 1]);
      print("---------------------------------\n\n");
    }
  }
}
