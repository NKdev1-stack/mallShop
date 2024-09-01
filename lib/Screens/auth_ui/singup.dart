import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mallshop/Controllers/signUp_controller.dart';
import 'package:mallshop/Screens/auth_ui/signIn.dart';
import 'package:mallshop/Utils/app_constant.dart';
import 'package:mallshop/Widgets/text_form_widget.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _NameController = TextEditingController();

  TextEditingController _EmailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool obscureText = true;
  SignupController _signupController = SignupController();

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
                  obsecureText: false,
                  controller: _NameController,
                  hintText: "Full Name",
                ),
              ),
              Text_Form_Field(
                obsecureText: false,
                controller: _EmailController,
                hintText: "Email",
              ),
              Text_Form_Field(
                obsecureText: obscureText,
                controller: _passwordController,
                hintText: "Password",
                IconforpasswordVisibility: obscureText
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = false;
                          });
                        },
                        icon: const Icon(Icons.visibility_off))
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = true;
                          });
                        },
                        icon: const Icon(Icons.visibility)),
              ),
              InkWell(
                onTap: () async {
                  String Email = _EmailController.text.toString().trim();
                  String Name = _NameController.text.toString().trim();
                  String Password = _passwordController.text.toString().trim();
                  if (Email.isEmpty || Name.isEmpty || Password.isEmpty) {
                     Get.snackbar("Error", "Incorrect Data");
                   
                  } else {
                     UserCredential? userCredential =
                     await _signupController.signUpwithEmail(
                        Name, Email, "", "", Password);
                    
                    if(userCredential!=null){
                      Get.snackbar('Email Verification', "Kindly Check your Email to verify the Account");
                      FirebaseAuth.instance.signOut();
                      Get.offAll(()=> SignIn());
                    }
                  }
                
                },
                child: Container(
                  margin: const EdgeInsets.all(30),
                  alignment: Alignment.center,
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomRight,
                          colors: [Colors.deepOrange, Colors.orange])),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.bottomCenter,
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account!",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      InkWell(
                          onTap: () {
                            Get.offAll(() => SignIn());
                          },
                          child: const Text(
                            " Sign In",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
