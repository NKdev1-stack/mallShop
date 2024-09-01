import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mallshop/Controllers/_signInController.dart';
import 'package:mallshop/Controllers/forget_password_controller.dart';
import 'package:mallshop/Controllers/getUserData_controller.dart';
import 'package:mallshop/Screens/admin_panel/mainScreenAdmin.dart';
import 'package:mallshop/Screens/auth_ui/singup.dart';
import 'package:mallshop/Screens/user_panel/main_screen_user.dart';
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

  final SignInController _signInController = SignInController();
  final ForgetPasswordController _forgetPasswordController =
      ForgetPasswordController();
  final getUserDataController _getuserdataController = getUserDataController();
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
                onTap: () {},
                child: Text_Form_Field(
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
                            icon: const Icon(Icons.visibility))),
              ),
              InkWell(
                  onTap: () {
                    ForgetPassword();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30, top: 20),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.grey.shade600),
                        )),
                  )),
              InkWell(
                onTap: () async {
                  String Email = _EmailController.text.toString().trim();
                  String password = _passwordController.text.toString().trim();
                  if (Email.isEmpty || password.isEmpty) {
                    Get.snackbar('Login failed', "Check Email and Password",
                        snackPosition: SnackPosition.BOTTOM);
                  } else {
                    UserCredential userCredential =
                        await _signInController.SignInWithEmail(
                            Email, password);
                    // Now we will check is the current sign in user is Admin or not if admin move to antoher screen else more to user page
                    // saving the receiving docs in userData from the method GetUserData()
                    var userData = await _getuserdataController
                        .getUserData(userCredential.user!.uid);

                    if (userCredential != null) {
                      // Checkinng is email is verify or not
                      if (userCredential.user!.emailVerified) {
                        /// Checking if the isAdmin is true then pass open admin page else open user panel
                        if (userData[0]['isAdmin'] == true) {
                          Get.snackbar('Success', 'Welcome to Admin Panel',
                              snackPosition: SnackPosition.BOTTOM);
                          Get.off(() => const AdminPanel());
                        } else {
                          Get.snackbar('Success', 'Welcome back!',
                              snackPosition: SnackPosition.BOTTOM);
                          Get.off(() => const UserPanel());
                        }
                        EasyLoading.dismiss();
                      } else {
                        Get.snackbar("Verification Error",
                            "Verify your Email to Continue",
                            snackPosition: SnackPosition.BOTTOM);
                        EasyLoading.dismiss();
                      }
                    } else {
                      Get.snackbar(
                          "Server Error", "We are trying to fix the issue.",
                          snackPosition: SnackPosition.BOTTOM);
                      EasyLoading.dismiss();
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
                    "Sign In",
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
                        "New user Please!",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      InkWell(
                          onTap: () {
                            Get.offAll(() => SignUp());
                          },
                          child: const Text(
                            " Sign Up",
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

  Future<void> ForgetPassword() async {
    TextEditingController _forgetPassword = TextEditingController();
    String UserForgetEmail;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Fill this form to Forget the Password",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.grey.shade200),
                  child: TextFormField(
                    controller: _forgetPassword,
                    decoration: const InputDecoration(
                      hintText: "Enter Email",
                      contentPadding: EdgeInsets.all(20),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(Icons.email),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    UserForgetEmail = _forgetPassword.text.toString().trim();
                    if (UserForgetEmail.isEmpty) {
                      Get.snackbar('Error', "Email can't be empty",
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      _forgetPasswordController.ForgetPassword(UserForgetEmail);
                      Get.snackbar('Email Sent',
                          'Check your Email and Forget the Password',
                          snackPosition: SnackPosition.BOTTOM);
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 22, bottom: 10),
                    alignment: Alignment.center,
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomRight,
                            colors: [Colors.deepOrange, Colors.orange])),
                    child: const Text(
                      "Reset Password",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"))
              ],
            ),
          ),
        );
      },
    );
  }
}
