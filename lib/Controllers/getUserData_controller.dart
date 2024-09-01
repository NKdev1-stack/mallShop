import 'package:cloud_firestore/cloud_firestore.dart';

class getUserDataController{
final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;



// This method will get the user data so data will be a list and the list type will be QueryDocumentSnapshot
// and QueryDocumentSnapshot has a Object
// This Method will UID so this UID will help us to get the data of specific user 
Future<List<QueryDocumentSnapshot<Object?>>> getUserData(String uid)async{

// so in the database where inside the collection UID is equal to that uid which we will pass there so this will get the data and save it in variable
// .where() uid vo user ki details ka andr jo UID save ki ha aus ki vo ha vo agr match hoti is sa jo haam pass krien gy tb data get hoga
final QuerySnapshot userData= await _firebaseFirestore.collection('Users').where('UID',isEqualTo: uid).get(); 
   
   // Thne we will return all the docs which we are getting.
   return userData.docs;


}
}