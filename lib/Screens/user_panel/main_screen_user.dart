import 'package:cloud_firestore/cloud_firestore.dart';
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
        bottomNavigationBar: BottomNavigationBar(
          
          currentIndex: 0,
          elevation: 10,
          iconSize: 26,
          type:  BottomNavigationBarType.fixed,
          onTap: (index){
              setState(() {
                _selectedIndex = index;
              });
          },
         
          items:const [
           BottomNavigationBarItem(
            
            icon: Icon(Icons.home,color: Colors.black,),label: "Home"),

            BottomNavigationBarItem(icon: Icon(Icons.notifications,color: Colors.black),label: "Update"),

             BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: Colors.black),label: "Order"),

              BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp,color: Colors.black),label: "Profile"),
        ]),
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