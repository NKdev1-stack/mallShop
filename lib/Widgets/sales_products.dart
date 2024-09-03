import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:mallshop/Models/Product_model.dart';
import 'package:mallshop/Utils/app_constant.dart';

class SalesProducts_Widgets extends StatelessWidget {
  const SalesProducts_Widgets({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // In product collection where isSale is true then get snapshot
        future: FirebaseFirestore.instance.collection('products').where('isSale',isEqualTo: true).get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("No Data Found");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.data != null) {
            return Container(
              height: MediaQuery.sizeOf(context).height * 0.40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  // Calling Product Model and saving all data in it before showing then from model we will show the data easily
                  ProductModel _productModel = ProductModel(
                      productID: snapshot.data!.docs[index]['productID'],
                      categoryID: snapshot.data!.docs[index]['categoryId'],
                      productName: snapshot.data!.docs[index]['productName'],
                      categoryName: snapshot.data!.docs[index]['categoryName'],
                      saleprice: snapshot.data!.docs[index]['salePrice'],
                      fullprice: snapshot.data!.docs[index]['fullPrice'],
                      productImages: snapshot.data!.docs[index]['ProductImages'],
                      deliveryTime: snapshot.data!.docs[index]['deliveryTime'],
                      isSale: snapshot.data!.docs[index]['isSale'],
                      productDescription: snapshot.data!.docs[index]
                          ['ProductDescription'],
                          MinimumPiece: snapshot.data!.docs[index]['MinimumPiece'],
                      createdAt: snapshot.data!.docs[index]['createdAt'],
                      updatedAt: snapshot.data!.docs[index]['updatedAt']);

                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          child: FillImageCard(
                            imageProvider: CachedNetworkImageProvider(_productModel.productImages[0]),
                            width: 200,
                            heightImage: 140,
                            title: Text(_productModel.productName,overflow: TextOverflow.ellipsis),
                            footer: Row(
                              children: [
                                Text("PKR ${_productModel.saleprice}",style: const TextStyle(fontWeight: FontWeight.bold),),
                               const SizedBox(width: 10,),
                                Text(_productModel.fullprice,style:const TextStyle(decoration: TextDecoration.lineThrough,color: AppConstant.appMaincolor),),
                              ],
                            ),
                            description: Text("Minimum Order ${_productModel.MinimumPiece} Piece"),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          }
          return Container();
        });
  }
}
