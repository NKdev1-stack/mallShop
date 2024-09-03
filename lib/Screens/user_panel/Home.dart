import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:mallshop/Screens/user_panel/all_categories.dart';
import 'package:mallshop/Utils/app_constant.dart';
import 'package:mallshop/Widgets/banner_Carasoul.dart';
import 'package:mallshop/Widgets/category_widget.dart';
import 'package:mallshop/Widgets/sales_products.dart';

import '../../Widgets/heading_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            // App Bar Widget
              _appBar(),
              // Carasoul Widget for showing banner 
            BannerCarasoul_widget(),
            // Heading Widget for Categories
              HeadingWidget(onTap: (){
               Get.to(()=>const AllCategories());
              },title: 'Categories',subtitle: 'Buy in Quantity Only',buttonText: 'See More',),
            // Category Widget
            const CategoryWidget(),
            // Sales heading
             HeadingWidget(onTap: (){},title: 'Sales',subtitle: 'Fresh WholeSale for you',buttonText: 'Shop Now',),
            // Sales Product Widgets
               const SalesProducts_Widgets()
          ],
        ),
      ),
    );
  }


   Widget _appBar() {
    return  Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
      
          const Icon(Icons.qr_code_scanner_rounded,size: 25,),

          Flexible(
            child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  height: 38,
                  
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppConstant.appMaincolor,strokeAlign: BorderSide.strokeAlignCenter,width: 2)),
                     
                     
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4,left: 5),
                              child: Icon(
                                Icons.linked_camera_outlined,
                                size: 25,
                              ),
                            ),
                          ),
                          SizedBox(width: 2),
                          Text("Cars for Kids",style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      
                
                     
                       Container(
                        height: 35,
                        width: 60,
                        margin: const EdgeInsets.only(right: 1),
                        decoration: BoxDecoration(
                          color: AppConstant.appMaincolor,
                          borderRadius: BorderRadius.circular(5)
                        ),
                       child:const Center(child: Text("Search",style:TextStyle(color: Colors.white,fontSize: 13) ,)),
                       )
                    ])
                       
            ),
          ),
           const Padding(
          padding:  EdgeInsets.only(left: 4,right: 4),
          child: Icon(Icons.account_balance_wallet_outlined),
        ), 
      
      ],),
    );
    

    
    
  }

  
}