import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:graduationlion/controller/recommend_controller.dart';
import 'package:graduationlion/controller/requirement_controller.dart';
import 'package:graduationlion/core/constants/firestore_collections.dart';
import 'package:graduationlion/core/utils/email_validator.dart';
import 'package:graduationlion/model/user_course_model.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  late List<UserCourseModel> userCourses;
  late int englishGrade = 0;
  late int percentage = 0;
  late int semester;
  late String major;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadUserCourses();
    await loadUserData();
  }

  Future<void> loadUserData() async {
    final db = FirebaseFirestore.instance;

    var snapshot = await db
        .collection(FirestoreCollections.users)
        .doc(FirebaseAuth.instance.currentUser?.email)
        .get();

    englishGrade = snapshot.data()!['englishGrade'];
    semester = snapshot.data()!['semester'];
    major = snapshot.data()!['major'];

    await RecommendController.to.loadRecommendCourses();
  }

  Future<void> loadUserCourses() async {
    final db = FirebaseFirestore.instance;

    var snapshot = await db
        .collection(FirestoreCollections.users)
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection(FirestoreCollections.courses)
        .get();

    userCourses = [];

    for (var element in snapshot.docs) {
      userCourses.add(UserCourseModel.fromJson(element.data()));
    }
  }

  Future<void> addCourseData(Map<String, dynamic> json, bool isEnglish,
      String gradeOrPf, String semester) async {
    final db = FirebaseFirestore.instance
        .collection(FirestoreCollections.users)
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection(FirestoreCollections.courses);

    json['gradeOrPf'] = gradeOrPf;
    json['isEnglish'] = isEnglish;
    if (!json.containsKey("category")) json['category'] = "전공";
    json['semester'] = semester;
    if (!json.containsKey("design")) json['design'] = 0;

    userCourses.add(UserCourseModel.fromJson(json));
    await RequirementController.to.calculateRequirement();
    await db.add(UserCourseModel.fromJson(json).toJson());
  }

  Future<bool> checkDuplicated(Map<String, dynamic> json) async {
    bool duplicated = await FirebaseFirestore.instance
        .collection(FirestoreCollections.users)
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection(FirestoreCollections.courses)
        .where('name', isEqualTo: json['name'])
        .get()
        .then((QuerySnapshot qs) {
      return qs.docs.isNotEmpty ? true : false;
    });
    return duplicated;
  }

  Future<void> deleteCourse(Map<String, dynamic> json) async {
    late String docId;
    await FirebaseFirestore.instance
        .collection(FirestoreCollections.users)
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection(FirestoreCollections.courses)
        .where('name', isEqualTo: json['name'])
        .get()
        .then((QuerySnapshot qs) {
      docId = qs.docs[0].id;
    });
    WriteBatch batch = FirebaseFirestore.instance.batch();

    batch.delete(FirebaseFirestore.instance.doc(FirestorePaths.userCourse(
        FirebaseAuth.instance.currentUser!.email!, docId)));

    return batch.commit();
  }

  Future<bool> signin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final db = FirebaseFirestore.instance;

    if (!checkEmail(googleUser!.email)) {
      await FirebaseAuth.instance.signOut();
      return false;
    }

    var check = await db
        .collection(FirestoreCollections.users)
        .doc(googleUser.email)
        .get();

    if (!check.exists) {
      await db
          .collection(FirestoreCollections.users)
          .doc(googleUser.email)
          .set({"email": googleUser.email});
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    return true;
  }

  bool checkEmail(String googleUser) {
    return isHandongEmail(googleUser);
  }

  Future<void> addInitData(
      int department, int semester, int englishSubmit, int englishGrade) async {
    await FirebaseFirestore.instance
        .collection(FirestoreCollections.users)
        .doc(FirebaseAuth.instance.currentUser?.email)
        .update({
      "major": department == 0 ? '컴공' : '전자',
      "semester": semester,
      "englishSubmit": englishSubmit == 0 ? true : false,
      "englishGrade": englishGrade
    });
  }
}
