import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationlion/controller/requirementController.dart';
import 'package:graduationlion/model/courseModel.dart';

import '../model/gcourseModel.dart';

class CourseController extends GetxController {
  static CourseController get to => Get.find();
  late List<CourseModel> majorCourses;
  late List<GCourseModel> generalCourses;
  late List<GCourseModel> bsmCourses;
  late List<GCourseModel> SGCourses;

  @override
  Future<void> onInit() async {
    super.onInit();
    // await FirebaseAuth.instance.signOut();
    await initMajorCourses();
    await initGeneralCourses();
    await initBsmCourses();
    await initSGCourses();
    await RequirementController.to.calculateRequirement();
  }

  Future<void> initMajorCourses() async {
    var db = FirebaseFirestore.instance;
    majorCourses = [];
    var snapshot = await db.collection('Courses').get();
    for (var element in snapshot.docs) {
      majorCourses.add(CourseModel.fromJson(element.data()));
    }
    // print(majorCourses);
  }

  Future<void> initGeneralCourses() async {
    var db = FirebaseFirestore.instance;
    generalCourses = [];
    var snapshot = await db.collection('GCourses').get();
    for (var element in snapshot.docs) {
      generalCourses.add(GCourseModel.fromJson(element.data()));
    }
    // print(majorCourses);
  }

  Future<void> initBsmCourses() async {
    var db = FirebaseFirestore.instance;
    bsmCourses = [];
    var snapshot = await db.collection('BSM').get();
    for (var element in snapshot.docs) {
      bsmCourses.add(GCourseModel.fromJson(element.data()));
    }
    // print(majorCourses);
  }

  Future<void> initSGCourses() async {
    var db = FirebaseFirestore.instance;
    SGCourses = [];
    var snapshot = await db.collection('SGCourses').get();
    for (var element in snapshot.docs) {
      SGCourses.add(GCourseModel.fromJson(element.data()));
    }
    // print(majorCourses);
  }

  // 신앙및세계관
  List<GCourseModel> getCategory1() {
    return generalCourses
        .where((element) =>
            element.category.contains("신앙") || element.category.contains("세계관"))
        .toList();
  }

  // 인성 및 리더십
  List<GCourseModel> getCategory2() {
    return generalCourses
        .where((element) =>
            element.category == "인성" || element.category == "리더십 및 문제해결")
        .toList();
  }

  // 전문 교양
  List<GCourseModel> getCategory3() {
    // TODO : 전문 교양 필드 추가
    return SGCourses;
  }

  // 수학 및 기초과학 - 컴공
  List<GCourseModel> getCategory4() {
    // TODO : 수학 및 기초과학 필드 추가
    return bsmCourses;
  }

  // 수학 및 기초과학 + ICT융합기초 - 전자
  List<GCourseModel> getCategory4_EE() {
    // TODO : 수학 및 기초과학 필드 추가 (주의: 전자/컴공 인정 과목 다름)
    List<GCourseModel> bsmEE = [];

    bsmEE.addAll(bsmCourses);
    bsmEE.removeWhere((element) => element.name == "이산수학");
    return bsmEE;
  }

  // ICT융합기초 - 컴공
  List<GCourseModel> getCategory5() {
    return generalCourses
        .where((element) =>
            element.name == "소프트웨어 입문" ||
            element.name == "파이썬 프로그래밍" ||
            element.name == "R 을 이용한 빅데이터 분석" ||
            element.name == "데이터수집과 응용" ||
            element.name == "모두를 위한 인공지능의 활용")
        .toList();
  }

  // 자유선택(교양)
  List<GCourseModel> getCategory6() {
    return generalCourses;
  }

  List<GCourseModel> getCategory7() {
    return generalCourses
        .where((element) => element.category.contains("실무 영어"))
        .toList();
  }

  // 개발자용) 수업 추가 함수
  Future<void> addData() async {
    var db = FirebaseFirestore.instance;
    // var temp =
    await db
        .collection("Recommned")
        .doc("전자")
        .collection("Courses")
        .doc("semester8")
        .set({
      "must": ['자유를 누리세요'],
      "select": []

      // "name": "ERC",
      // 'gradeOrPf': "의미없음",
      // 'credit': 3,
      // 'type': "의미없음",
      // 'detail': "",
      // 'category': "의미없음",
      // 'semester': 3

      // 'englishName': 'NULL',
      // 'type': "선택필수",
      // 'design': 0,
      // 'semester': '4-2',
    });
    // temp.get().then((value) => print(value.data()));
  }
}
