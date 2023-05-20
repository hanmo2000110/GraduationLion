import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationlion/model/courseModel.dart';

class CourseController extends GetxController {
  static CourseController get to => Get.find();
  late List<CourseModel> majorCourses;
  late List<CourseModel> generalCourses;

  @override
  Future<void> onInit() async {
    super.onInit();
    await initMajorCourses();
  }

  Future<void> initMajorCourses() async {
    var db = FirebaseFirestore.instance;
    majorCourses = [];
    var snapshot = await db.collection('Courses').get();
    snapshot.docs.forEach(
        (element) => majorCourses.add(CourseModel.fromJson(element.data())));
    print(majorCourses);
  }

  // 개발자용) 수업 추가 함수
  Future<void> addData() async {
    // var db = FirebaseFirestore.instance;
    // var temp = await db.collection("Courses").add({
    //   "name": "머신러닝",
    //   'englishName': 'Machine Learning',
    //   // 'englishName': 'NULL',
    //   'credit': 3,
    //   'type': "선택",
    //   // 'type': "선택필수",
    //   'design': 0,
    //   'detail': "",
    //   'semester': '4-2'
    // });
    // temp.get().then((value) => print(value.data()));
  }
}
