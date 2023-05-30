import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduationlion/model/userCourseModel.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  late List<UserCourseModel> userCourses;

  Future<void> onInit() async {
    super.onInit();
    await loadUserCourses();
  }

  Future<void> loadUserCourses() async {
    final db = FirebaseFirestore.instance;

    var snapshot = await db
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("Courses")
        .get();

    userCourses = [];

    for (var element in snapshot.docs) {
      userCourses.add(UserCourseModel.fromJson(element.data()));
    }
    // print(userCourse.length);
  }

  Future<void> addCourseData(Map<String, dynamic> json, bool isEnglish,
      String gradeOrPf, String semester) async {
    final db = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("Courses");

    json['gradeOrPf'] = gradeOrPf;
    json['isEnglish'] = isEnglish;
    if (!json.containsKey("category")) json['category'] = "전공";
    json['semester'] = semester;
    if (!json.containsKey("design")) json['design'] = 0;

    await db.add(UserCourseModel.fromJson(json).toJson());
  }

  Future<bool> checkDuplicated(Map<String, dynamic> json) async {
    bool duplicated = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("Courses")
        .where('name', isEqualTo: json['name'])
        .get()
        .then((QuerySnapshot qs){
          return qs.docs.isNotEmpty ? true : false;
    });
    return duplicated;
  }

  Future<bool> signin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final db = FirebaseFirestore.instance;

    if (!googleUser!.email.contains("@handong.ac.kr")) {
      await FirebaseAuth.instance.signOut();
      return false;
    }

    var check = await db.collection("Users").doc(googleUser.email).get();

    if (!check.exists) {
      await db
          .collection("Users")
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

  Future<void> addInitData(
      int department, int semester, int englishSubmit, int englishGrade) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .update({
      "major": department == 0 ? '컴공' : '전자',
      "semester": semester,
      "englishSubmit": englishSubmit == 0 ? true : false,
      "englishGrade": englishGrade
    });
  }
}
