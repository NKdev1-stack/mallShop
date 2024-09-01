import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mallshop/Models/user_model.dart';
import 'package:mallshop/Screens/user_panel/main_screen.dart';

// Extends class from GetX Controllerfor Managing state: Easily update and access state variables
class GoogleSigninController {
  // Instance of Google Sign In
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential userCredential;

  // Method for Google Sign In and further coding

  Future<void> signInwithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? Gauth =
          await googleSignInAccount!.authentication;
      AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: Gauth.accessToken,
        idToken: Gauth.idToken,
      );

      userCredential = await FirebaseAuth.instance.signInWithCredential(authCredential);

      String UID = userCredential.user!.uid.toString();

        final bool OlduserorNot = await isAlreadyRegistered(UID);

        if(OlduserorNot){
          Get.offAll(()=>const MainScreen());
        }else if(userCredential!=null){
         
            sendToDB(UID,userCredential); 
            
        }

    } catch (e) {}

    
    //  Get.offAll(()=>const MainScreen());

    // }
  }

  Future <bool> isAlreadyRegistered(String UID)async{

      try {
         DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection("Users").doc(UID).get();

         return snapshot.exists; // this will return bool
      } catch (e) {
          return false;
      }
  }

  Future<void>sendToDB(String UID,UserCredential userCredential)async{
    
          
 UserModel userModel = UserModel(UID: userCredential.user!.uid.toString(), userName: userCredential.user!.displayName.toString(), 
          email: userCredential.user!.email.toString(), phone: userCredential.user!.phoneNumber.toString(), userImg:userCredential.user!.photoURL!,
           userDeviceToken: "", country: "", userAddress: "", street: "", 
           isAdmin: false, isActive: true, createdOn: DateTime.now(), CityName: "");
           await FirebaseFirestore.instance.collection("Users").doc(UID).set(userModel.toMap());
            EasyLoading.dismiss();
           Get.offAll(()=>const MainScreen());

        

    
  }
}
