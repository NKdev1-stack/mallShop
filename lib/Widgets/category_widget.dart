import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:mallshop/Models/Category_model.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('categories').get(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error"),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text("No Data found"),
          );
        } else if (snapshot.data != null) {
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                // Just Simply call the model and pass data in it from Snapshot
                CategoryModel _categoryModel = CategoryModel(
                    Minimum: snapshot.data!.docs[index]['Minimum'],
                    categoryID: snapshot.data!.docs[index]['CategoryID'],
                    categoryImg: snapshot.data!.docs[index]['CategoryImg'],
                    categoryName: snapshot.data!.docs[index]['CategoryName'],
                    createdAt: snapshot.data!.docs[index]['CreatedAt'],
                    updatedAt: snapshot.data!.docs[index]['UpdatedAt']);
                return Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Container(
                        // using cached network image provider for showing image from URL
                        // And getting data form Category Model instance and showing it in app
                        child: FillImageCard(
                          imageProvider: CachedNetworkImageProvider(
                              _categoryModel.categoryImg),
                          width: 200,
                          heightImage: 140,
                          title: Text(_categoryModel.categoryName,overflow: TextOverflow.ellipsis,),
                        
                          
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
      },
    );
  }
}
