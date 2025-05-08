import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static String? getUserId() {
    return _auth.currentUser?.uid;
  }

  static Future<UserCredential?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        "email": email,
        "createdAt": DateTime.now(),
      });

      return userCredential;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  static Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}
