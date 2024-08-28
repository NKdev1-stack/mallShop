import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:mallshop/Controllers/google_signIn_controller.dart';
import 'package:mallshop/Utils/app_constant.dart';

class WelcomeScreen extends StatefulWidget {
   WelcomeScreen({super.key});


  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
    final GoogleSigninController _googleSigninController = GoogleSigninController();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late UserCredential userCredential;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.statusBarColor,
        elevation: 0,
      ),
      body: Container(
          color: Colors.white60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.center,
                height: 100,
                child: Lottie.asset("assets/splash_icon.json")),
            ),
            Text(
                        AppConstant.appMainName,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),


                      ),
                   const SizedBox(height:50 ,),

                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                        
                            InkWell(
                              onTap: (){
                               _googleSigninController.signInwithGoogle();
                              },
                              child: Card(
                                elevation: 5,
                                color: Colors.white,
                                child: Container(
                                  height: 50,
                                  
                                margin: const EdgeInsets.only(left: 30,right: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/google.png',height: 40,width: 40,),                                  
                                    
                                   const Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text("Log in With Google",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)))
                                  ],
                                ),
                                ),
                              ),
                            ),
                           
                             InkWell(
                              onTap: (){},
                               child: Card(
                                elevation: 5,
                                color: Colors.white,
                                child: Container(
                                  height: 50,
                                 
                                margin:const EdgeInsets.only(left: 30,right: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   Padding(
                                     padding: const EdgeInsets.only(right: 8),
                                     child: Icon(Icons.mail_outline,color: Colors.amber,size: 30,),
                                   ),                        
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text("Log in With Email",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    )
                                  ],
                                ),
                                ),
                                                           ),
                             )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                            const Text("Haven't Signed Up Yet?"),
                      
                                      TextButton(onPressed: (){}, child: const Text("Signup Now",style: TextStyle(fontWeight: FontWeight.bold))),
                                      
                        ],
                      )
                    

          ],
        ),
      
      ),
    );
  }
}