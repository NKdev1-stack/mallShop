import 'dart:convert';

class CategoryModel {
// We will use this Model to show Category data and also we will use it to add category in admin app
final String categoryID;
final String categoryImg;
final String categoryName;
final dynamic createdAt;
final dynamic updatedAt;
final String Minimum;
  CategoryModel({
    required this.categoryID,
    required this.categoryImg,
    required this.categoryName,
    required this.createdAt,
    required this.Minimum,
    required this.updatedAt,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryID': categoryID,
      'categoryImg': categoryImg,
      'categoryName': categoryName,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'Minimum':Minimum,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryID: map['categoryID'] as String,
      categoryImg: map['categoryImg'] as String,
      categoryName: map['categoryName'] as String,
      createdAt: map['createdAt'] as dynamic,
      updatedAt: map['updatedAt'] as dynamic,
      Minimum: map['Minimum'] as dynamic,
    );
  }

}