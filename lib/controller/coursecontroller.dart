import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationlion/model/courseModel.dart';

import '../model/gcourseModel.dart';

class CourseController extends GetxController {
  static CourseController get to => Get.find();
  late List<CourseModel> majorCourses;
  late List<GCourseModel> generalCourses;

  @override
  Future<void> onInit() async {
    super.onInit();
    // await FirebaseAuth.instance.signOut();
    await initMajorCourses().then((value) => null);
    await initGeneralCourses();
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

  // 신앙및세계관
  List<GCourseModel> getCategory1(){
    return generalCourses.where((element) =>
        element.category.contains("신앙")).toList();
  }

  // 인성 및 리더십
  List<GCourseModel> getCategory2(){
    return generalCourses.where((element) =>
      element.category=="인성" || element.category=="리더십 및 문제해결").toList();
  }

  // 전문 교양
  List<GCourseModel> getCategory3(){
    // TODO : 전문 교양 필드 추가
    return generalCourses;
  }

  // 수학 및 기초과학 - 컴공
  List<GCourseModel> getCategory4(){
    // TODO : 수학 및 기초과학 필드 추가
    return generalCourses;
  }

  // 수학 및 기초과학 + ICT융합기초 - 전자
  List<GCourseModel> getCategory4_EE(){
    // TODO : 수학 및 기초과학 필드 추가 (주의: 전자/컴공 인정 과목 다름)
    return generalCourses;
  }

  // ICT융합기초 - 컴공
  List<GCourseModel> getCategory5(){
    return generalCourses.where((element) =>
    element.name=="소프트웨어 입문" || element.name=="파이썬 프로그래밍" ||
        element.name=="R 을 이용한 빅데이터 분석" || element.name=="데이터수집과 응용" ||
        element.name=="모두를 위한 인공지능의 활용").toList();
  }

  // 자유선택(교양)
  List<GCourseModel> getCategory6(){
    return generalCourses;
  }

  // 개발자용) 수업 추가 함수
  Future<void> addData() async {
    // var db = FirebaseFirestore.instance;
    // var temp = await db.collection("GCourses").add({
    //   "name": "EAP",
    //   'gradeOrPf': "G",
    //   // 'englishName': 'Machine Learning',
    //   'credit': 3,
    //   'type': "교양필수",
    //   'detail': "",
    //   'category': "실무 영어"

    //   // 'englishName': 'NULL',
    //   // 'type': "선택필수",
    //   // 'design': 0,
    //   // 'semester': '4-2',
    // });
    // temp.get().then((value) => print(value.data()));
  }
}
