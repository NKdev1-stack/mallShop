import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mallshop/Screens/user_panel/Home.dart';
import 'package:mallshop/Screens/user_panel/Messages.dart';
import 'package:mallshop/Screens/user_panel/Profile.dart';
import 'package:mallshop/Screens/user_panel/cart.dart';
import 'package:mallshop/Utils/app_constant.dart';

class UserPanel extends StatefulWidget {
  const UserPanel({super.key});

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const Messages(),
    const Cart(),
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
    GetAndSaveDeviceToken(); // Make sure this function is defined and does not block the UI thread
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 48,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          animationDuration: const Duration(milliseconds: 200),
          backgroundColor: AppConstant.appMaincolor, // Replace with AppConstant.appMaincolor
          items: const [
            Icon(Icons.home),
            Icon(Icons.message),
            Icon(Icons.delivery_dining),
            Icon(Icons.account_circle),
          ],
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }



 
  // For getting device Token
 GetAndSaveDeviceToken()
 async{

    FirebaseAuth _auth = FirebaseAuth.instance;

    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

     String? token = await FirebaseMessaging.instance.getToken();

     _firebaseFirestore.collection('Users').doc(_auth.currentUser!.uid.toString()).update({

      'userDeviceToken':token,
     });
 }
}
