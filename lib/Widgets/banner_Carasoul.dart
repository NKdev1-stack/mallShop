import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import 'package:mallshop/Controllers/banners_controllers.dart';
import 'package:mallshop/Utils/app_constant.dart';

class BannerCarasoul_widget extends StatefulWidget {
  BannerCarasoul_widget({super.key});

  @override
  State<BannerCarasoul_widget> createState() => _BannerCarasoul_widgetState();
}

class _BannerCarasoul_widgetState extends State<BannerCarasoul_widget> {
    // using RxList for getting and saving banner URLS
  RxList<String> bannerURLS = RxList<String>();
Future<void> fetchbannerURL() async {
    try {
      // saving the FirebaseFirestore docs under banners collection in bannerURLsnapshot
      QuerySnapshot bannerURLsnapshot =
          await FirebaseFirestore.instance.collection('banners').get();
      // then check is it empty or not
      if (bannerURLsnapshot.docs.isNotEmpty) {
        /* if not empty then take the RxList.values and set it equal to bannerURLsnapshot.docs.map (getting value map) and then in the map
        get the doc which is equal to imageURl and take its value as String and convert it to list
        */
        bannerURLS.value = bannerURLsnapshot.docs.map((doc) {
          return doc['imageUrl'] as String;
        }).toList();

        print("Hello an data" + bannerURLsnapshot.toString());
      } else {
        print(bannerURLsnapshot);
      }
    } catch (e) {
      print("NK ERRPR" + e.toString());
    }
  }
@override
  void initState() {
    fetchbannerURL();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 
    // Obx is helping us to refresh this widget specifically to again load images
         Obx(
          () {
           return  CarouselSlider(
                    
        items: bannerURLS.map((ImageURLS) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            // Using CachedNetworkImage for extra functionality
            child: CachedNetworkImage(imageUrl: ImageURLS,width:Get.width - 10,fit: BoxFit.cover,errorWidget: (context, url, error) {
              return const Icon(Icons.error);
            },placeholder: (context, url) {
              return const ColoredBox(child: CupertinoActivityIndicator(),color: Colors.white,);
            } ,)
          );
        }).toList(),
        options: CarouselOptions(
          enableInfiniteScroll: false,
          scrollPhysics: const BouncingScrollPhysics(),
           
            aspectRatio: 2.4,
            autoPlay: true,
            viewportFraction: 1));
          },
         );
      }
    
  }


// CarouselSliderController _carouselSliderController =
//       CarouselSliderController();
//         return CarouselSlider(
//           items: _bannersControllers.bannerURLS
//               .map((imageUrls) => ClipRRect(
//                     borderRadius: BorderRadius.circular(10.0),
//                     child: CachedNetworkImage(
//                       imageUrl: imageUrls,
//                       fit: BoxFit.cover,
//                       width: Get.width - 10,
//                       placeholder: (context, url) => const ColoredBox(
//                         color: Colors.white,
//                         child: Center(
//                           child: CupertinoActivityIndicator(),
//                         ),
//                       ),
//                       errorWidget: (context,url,error)=>const Icon(Icons.error),
//                     ),
//                   ))
//               .toList(),
//           options: CarouselOptions(
//               scrollDirection: Axis.horizontal,
//               autoPlay: true,
//               aspectRatio: 2.5,
//               viewportFraction: 1),
//         );
//       }),
//     );

// 
