import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {


  final String productID;
  final String categoryID;
  final String productName;
  final String categoryName;
  final String saleprice;
  final String fullprice;
  final List productImages;
  final String deliveryTime;
  final bool isSale;
  final String  productDescription;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic MinimumPiece;
  ProductModel({
    required this.productID,
    required this.categoryID,
    required this.productName,
    required this.categoryName,
    required this.saleprice,
    required this.fullprice,
    required this.productImages,
    required this.deliveryTime,
    required this.isSale,
    required this.productDescription,
    required this.createdAt,
    required this.updatedAt,
    required this.MinimumPiece
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productID': productID,
      'categoryID': categoryID,
      'productName': productName,
      'categoryName': categoryName,
      'saleprice': saleprice,
      'fullprice': fullprice,
      'productImages': productImages,
      'deliveryTime': deliveryTime,
      'isSale': isSale,
      'productDescription': productDescription,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'MinimumPiece':MinimumPiece,
    };
  }


}
