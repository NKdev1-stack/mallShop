
// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {

  final String UID;
  final String userName;
  final String email;
  final String phone;
  final String userImg;
  final String userDeviceToken;
  final String country;
  final String userAddress;
  final String street;
  final bool isAdmin;
  final bool isActive;
  final dynamic createdOn;
  UserModel({
    required this.UID,
    required this.userName,
    required this.email,
    required this.phone,
    required this.userImg,
    required this.userDeviceToken,
    required this.country,
    required this.userAddress,
    required this.street,
    required this.isAdmin,
    required this.isActive,
    required this.createdOn,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'UID': UID,
      'userName': userName,
      'email': email,
      'phone': phone,
      'userImg': userImg,
      'userDeviceToken': userDeviceToken,
      'country': country,
      'userAddress': userAddress,
      'street': street,
      'isAdmin': isAdmin,
      'isActive': isActive,
      'createdOn': createdOn,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      UID: map['UID'] as String,
      userName: map['userName'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      userImg: map['userImg'] as String,
      userDeviceToken: map['userDeviceToken'] as String,
      country: map['country'] as String,
      userAddress: map['userAddress'] as String,
      street: map['street'] as String,
      isAdmin: map['isAdmin'] as bool,
      isActive: map['isActive'] as bool,
      createdOn: map['createdOn'] as dynamic,
    );
  }
}