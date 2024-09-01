import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mallshop/Models/user_model.dart';
import 'package:mallshop/Screens/user_panel/main_screen_user.dart';
import 'package:mallshop/Utils/app_constant.dart';

class SignupController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  

  Future<UserCredential?> signUpwithEmail(
    String userName,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
    
   
  ) async {
    try {
            EasyLoading.show(status: "Please wait!");

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);

      // Sending email verification for Verifying the Email
      await userCredential.user!.sendEmailVerification();
   //Calling method to get device token
    // Passing data to Usermodel then easily we can send this data to Firebase
    
      UserModel userModel = UserModel(
          UID: userCredential.user!.uid,
          userName: userName,
          email: userEmail,
          phone: userPhone,
          userImg: "",
          userDeviceToken:"",
          country: "",
          userAddress: "",
          street: "",
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
          CityName: userCity);


          // Sending data to Database

         await _firebaseFirestore.collection('Users').doc(userCredential.user!.uid).set(userModel.toMap());
          EasyLoading.dismiss();
          Get.offAll(()=>const UserPanel());
          return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        e.toString(),
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appMaincolor,
      );
    }
  }

  
}
