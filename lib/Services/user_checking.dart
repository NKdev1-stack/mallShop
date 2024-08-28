import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mallshop/Screens/auth_ui/welcome_screen.dart';
import 'package:mallshop/Screens/user_panel/main_screen.dart';
import 'package:mallshop/firebase_options.dart';

class UserChecking extends StatefulWidget {
  const UserChecking({super.key});

  @override
  State<UserChecking> createState() => _UserCheckingState();
}

class _UserCheckingState extends State<UserChecking> {
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context, snapshot) {
      if(snapshot.hasData){
       return const MainScreen();
      }else{
        return WelcomeScreen();
      }
    },);
  }
}