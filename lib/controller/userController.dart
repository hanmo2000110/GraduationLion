import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

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
}
