import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallshop/Controllers/getUserData_controller.dart';
import 'package:mallshop/Screens/admin_panel/mainScreenAdmin.dart';
import 'package:mallshop/Screens/auth_ui/welcome_screen.dart';
import 'package:mallshop/Screens/user_panel/main_screen_user.dart';
import 'package:mallshop/firebase_options.dart';

class UserChecking extends StatefulWidget {

  const UserChecking({super.key});

  @override
  State<UserChecking> createState() => _UserCheckingState();
}

class _UserCheckingState extends State<UserChecking> {
  getUserDataController _getuserdataController = new getUserDataController();
  bool admin = false;
  @override
   initState() {
   checkIsAdminorNot();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
     
       


     if(admin){
       if(snapshot.hasData){
        
        
    
       return const AdminPanel();
      }else{
        return WelcomeScreen();
      }
     }else {
       if(snapshot.hasData){
      
       return const UserPanel();
      }else{
        return WelcomeScreen();
      }
     }
    },);
  }

// Method for checking is Admin is logged in or user so after cofrmation we will keep the user even he close the app
  Future<void>checkIsAdminorNot()async{
      var userData =  await _getuserdataController.getUserData(FirebaseAuth.instance.currentUser!.uid.toString());


        if(userData[0]['isAdmin']){
            admin = true;
            setState(() {
              
            });
        }else{
            admin = false;
            setState(() {
              
            });
        }
  }



}