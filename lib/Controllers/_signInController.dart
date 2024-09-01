import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController{

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserCredential? userCredential;


  Future<UserCredential> SignInWithEmail(

    String userEmail,
    String userPassword,
    

  )async{

      EasyLoading.show();
  userCredential = await _auth.signInWithEmailAndPassword(email: userEmail,
     password: userPassword).onError((error, stackTrace) {
       Get.snackbar('Login Error', 'Email and Password are incorrect',snackPosition: SnackPosition.BOTTOM);
       EasyLoading.dismiss();
        return userCredential! ;
     },);

    
    return userCredential!;


  }
}