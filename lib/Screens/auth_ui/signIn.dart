
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mallshop/Screens/auth_ui/singup.dart';
import 'package:mallshop/Utils/app_constant.dart';
import 'package:mallshop/Widgets/text_form_widget.dart';

class SignIn extends StatefulWidget {
   SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _EmailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool obscureText = true;

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
                      "Welcome Back!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign In to Explore MallShop.",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              
              Text_Form_Field(
                obsecureText: false,
                  controller: _EmailController,
                  hintText: "Email",
                 
                 ),
              InkWell(
                onTap: (){
                  
                },
                child: Text_Form_Field(
                  obsecureText: obscureText,
                    controller: _passwordController,
                    hintText: "Password",
                    
                    IconforpasswordVisibility:
                    obscureText? IconButton(onPressed: (){
                      setState(() {
                        obscureText = false;
                      });
                    }, icon: const Icon(Icons.visibility_off))
                    :IconButton(onPressed: (){
                                              setState(() {
                                                obscureText = true;
                                              });

                    }, icon: const Icon(Icons.visibility))

                    ),
              ),
                
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
                child: const Text("Sign In",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              ),
      
              Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New user Please!",style: TextStyle(color: Colors.grey.shade700),),
                   InkWell(
                    onTap: (){
                      Get.offAll(()=>SignUp());
                    },
                    child: const Text(" Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),))
              
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
