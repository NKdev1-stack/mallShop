
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mallshop/Screens/auth_ui/signIn.dart';
import 'package:mallshop/Utils/app_constant.dart';
import 'package:mallshop/Widgets/text_form_widget.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});

  TextEditingController _NameController = TextEditingController();

  TextEditingController _EmailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstant.statusBarColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Hello there, Sign up to continue.",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text_Form_Field(
                  controller: _NameController,
                  hintText: "Full Name",
                  icon: Icon(
                    Icons.account_circle,
                    size: 28,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
              Text_Form_Field(
                  controller: _NameController,
                  hintText: "Email",
                  icon: Icon(
                    Icons.email,
                    size: 28,
                    color: Colors.grey.shade700,
                  )),
              Text_Form_Field(
                  controller: _NameController,
                  hintText: "Password",
                  icon: Icon(
                    Icons.password_outlined,
                    size: 28,
                    color: Colors.grey.shade700,
                  )),
              Container(
                margin:const EdgeInsets.all(30),
                alignment: Alignment.center,
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      
                      begin: Alignment.center,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.deepOrange,
                        Colors.orange
                      ])
                ),
                child:  const Text("Sign Up",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
      
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an Account!",style: TextStyle(color: Colors.grey.shade700),),
                   InkWell(
                    onTap: (){
                      Get.offAll(()=>SignIn());
                    },
                    child: const Text(" Sign In",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))
              
                  ],
                                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
