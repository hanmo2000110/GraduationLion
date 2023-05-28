import 'package:firebase_auth/firebase_auth.dart';
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
    await initMajorCourses();
    await initGeneralCourses();
    print(generalCourses.length);
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
