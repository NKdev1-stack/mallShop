import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> ForgetPassword(String userEmail) async {
    try {
      EasyLoading.show(status: "Please Wait");
      // Using Firebase Auth method to setup password forget
      await _auth.sendPasswordResetEmail(email: userEmail);

      Get.snackbar(
          'Request Sent Successfully', "Password reset link sent to $userEmail",
          snackPosition: SnackPosition.BOTTOM);
          EasyLoading.dismiss();
    } catch (e) {
      EasyLoading.dismiss();
    }
  }
}
