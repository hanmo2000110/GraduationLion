import 'dart:math';

import 'package:get/get.dart';
import 'package:graduationlion/controller/coursecontroller.dart';
import 'package:graduationlion/controller/userController.dart';

class RequirementController extends GetxController {
  static RequirementController get to => Get.find();
  RxDouble totalCredit = 0.0.obs;

  // 신앙 및 세계관
  bool condition1 = false;
  RxDouble credit1 = 0.0.obs;
  RxList list1 = [].obs;

  // 인성 및 리더십
  bool condition2 = false;
  RxDouble credit2 = 0.0.obs;
  RxList list2 = [].obs;

  // 전문 교양
  bool condition3 = false;
  RxDouble credit3 = 0.0.obs;
  RxList list3 = [].obs;

  // 수학 및 기초과학
  bool condition4 = false;
  RxDouble credit4 = 0.0.obs;
  RxList list4 = [].obs;

  // ICT 융합 기초
  bool condition5 = false;
  RxDouble credit5 = 0.0.obs;
  RxList list5 = [].obs;

  // 실무 영어
  bool condition6 = false;
  RxDouble credit6 = 0.0.obs;
  RxList list6 = [].obs;

  // 교양 및 자유
  bool condition7 = false;
  RxDouble credit7 = 0.0.obs;
  RxList list7 = [].obs;

  // 전공
  bool condition8 = false;
  RxDouble credit8 = 0.0.obs;
  RxList list8 = [].obs;

  // PF 이수 과목
  bool condition9 = false;
  RxDouble credit9 = 0.0.obs;
  RxList list9 = [].obs;

  bool condition10 = false;
  RxDouble credit10 = 0.0.obs;
  RxList list10 = [].obs;

  Future<void> calculateRequirement() async {
    await countTotalCredit();

    condition1 = await check1();
    condition2 = await check2();
    condition3 = await check3();
    condition4 = await check4();
    condition5 = await check5();
    condition6 = await check6();
    condition7 = await check7();
    condition8 = await check8();
    condition9 = await check9();
    condition10 = await check10();
    UserController.to.percentage = ((totalCredit.value / 130)*100).floor();
  }

  Future<void> countTotalCredit() async {
    totalCredit.value = 0;
    for (var course in UserController.to.userCourses) {
      totalCredit.value += course.credit;
    }
  }

  // 신앙 및 세계관
  Future<bool> check1() async {
    credit1.value = 0;
    list1.clear();
    var flag = true;
    var requirement1 = 0;
    var requirement2 = 0.0;
    var requirement3 = 0.0;
    var requirement4 = 0.0;
    var requirement5 = 0.0;

    for (var course in UserController.to.userCourses) {
      if (course.category == "신앙 1") {
        requirement1++;
        list1.add(course.name);
      }
      if (course.category == "신앙 2-1") {
        requirement2 += course.credit;
        list1.add(course.name);
      }
      if (course.category == "신앙 2-2") {
        requirement3 += course.credit;
        list1.add(course.name);
      }
      if (course.category == "세계관 1") {
        requirement4 += course.credit;
        list1.add(course.name);
      }
      if (course.category == "세계관 2") {
        requirement5 += course.credit;
        list1.add(course.name);
      }
    }

    if (requirement1 < 6) flag = false;
    if (requirement2 < 2) flag = false;
    if (requirement3 < 2) flag = false;
    if (requirement4 < 2) flag = false;
    if (requirement5 < 3) flag = false;

    credit1.value = requirement1 +
        requirement2 +
        requirement3 +
        requirement4 +
        requirement5;

    return flag;
  }

  // 인성 및 리더십
  Future<bool> check2() async {
    credit2.value = 0;
    list2.clear();
    var flag = true;
    var requirement1 = 0.0;
    var requirement2 = 0.0;
    var requirement3 = 0.0;

    for (var course in UserController.to.userCourses) {
      if (course.name.contains("공동체 리더십 훈련 ")) {
        requirement1 += course.credit;
        list2.add(course.name);
      }
      if (course.name.contains("사회봉사 ")) {
        requirement2 += course.credit;
        list2.add(course.name);
      }
      if (course.name == "한동인성교육") {
        requirement3 += course.credit;
        list2.add(course.name);
      }
    }

    if (requirement1 < 3) flag = false;
    if (requirement2 < 2) flag = false;
    if (requirement3 < 1) flag = false;

    credit2.value = requirement1 + requirement2 + requirement3;

    return flag;
  }

  // 전문 교양
  Future<bool> check3() async {
    credit3.value = 0;
    list3.clear();
    var flag = true;
    var requirement1 = 0.0;

    for (var course in UserController.to.userCourses) {
      for (var sgc in CourseController.to.SGCourses) {
        if (course.name == sgc.name) {
          requirement1 += course.credit;
          list3.add(course.name);
          break;
        }
      }
    }

    if (requirement1 < 3) flag = false;

    credit3.value = requirement1;

    return flag;
  }

  // 수학 및 기초과학
  Future<bool> check4() async {
    credit4.value = 0;
    list4.clear();
    var flag = true;
    var requirement1 = 0.0;

    for (var course in UserController.to.userCourses) {
      for (var bsm in CourseController.to.bsmCourses) {
        if (course.name == bsm.name) {
          requirement1 += course.credit;
          list4.add(course.name);
          break;
        }
      }
    }

    if (requirement1 < 3) flag = false;

    credit4.value = requirement1;

    return flag;
  }

  // ICT 융합 기초
  Future<bool> check5() async {
    credit5.value = 0;
    list5.clear();
    var flag = true;
    var requirement1 = 0.0;

    for (var course in UserController.to.userCourses) {
      if (course.name == "R 을 이용한 빅데이터 분석" ||
          course.name == "파이썬 프로그래밍" ||
          course.name == "C 프로그래밍" ||
          course.name == "데이터 수집과 응용" ||
          course.name == "모두를 위한 인공지능의 활용" ||
          course.name == "소프트웨어 입문") {
        requirement1 += course.credit;
        list5.add(course.name);
      }
    }

    if (requirement1 < 2) flag = false;

    credit5.value = requirement1;

    return flag;
  }

  // 실무 영어
  Future<bool> check6() async {
    credit6.value = 0;
    list6.clear();
    var flag = true;
    var requirement1 = 0.0;

    for (var course in UserController.to.userCourses) {
      if (course.category == "실무 영어") {
        requirement1 += course.credit;
        list6.add(course.name);
      }
    }

    if (requirement1 < 12 - UserController.to.englishGrade * 3) flag = false;

    credit6.value = requirement1;

    return flag;
  }

  // 교양 및 자유
  Future<bool> check7() async {
    credit7.value = 0;
    list7.clear();
    var flag = true;
    var requirement1 = 0.0;

    for (var course in UserController.to.userCourses) {
      if (list1.contains(course.name)) continue;
      if (list2.contains(course.name)) continue;
      if (list3.contains(course.name)) continue;
      if (list4.contains(course.name)) continue;
      if (list5.contains(course.name)) continue;
      if (list6.contains(course.name)) continue;
      if (course.category == "전공") continue;
      requirement1 += course.credit;
      list7.add(course.name);
    }

    if (requirement1 < 21 + UserController.to.englishGrade * 3) flag = false;

    credit7.value = requirement1;

    return flag;
  }

  // 전공
  Future<bool> check8() async {
    credit8.value = 0;
    list8.clear();
    var flag = true;
    var requirement1 = 0.0;

    for (var course in UserController.to.userCourses) {
      if (course.category == "전공") {
        list8.add(course.name);
        requirement1 += course.credit;
      }
    }

    if (requirement1 < 60) flag = false;

    credit8.value = requirement1;

    return flag;
  }

  // PF 과목 이수
  Future<bool> check9() async {
    credit9.value = 0;
    list9.clear();
    var flag = true;
    var requirement1 = 0.0;

    for (var course in UserController.to.userCourses) {
      if (course.gradeOrPf == "PF") {
        list9.add(course.name);
        requirement1 += course.credit;
      }
    }

    if (requirement1 < max(39, totalCredit.value * 0.3)) flag = false;

    credit9.value = requirement1;

    return flag;
  }

  Future<bool> check10() async {
    credit10.value = 0;
    list10.clear();
    var flag = true;
    var requirement1 = 0.0;
    var requirement2 = 0.0;
    var requirement3 = 0.0;

    for (var course in UserController.to.userCourses) {
      if (course.isEnglish == true && course.category != "실무 영어") {
        list10.add(course.name);
        requirement1 += course.credit;
        if (course.category == "전공")
          requirement2 += course.credit;
        else
          requirement3 += course.credit;
      }
    }

    if (requirement1 < 30) flag = false;
    if (requirement2 < 21) flag = false;
    if (requirement3 < 6) flag = false;

    credit10.value = requirement1;

    return flag;
  }
}
