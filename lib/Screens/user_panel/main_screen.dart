import 'package:flutter/material.dart';
import 'package:mallshop/Utils/app_constant.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body:  Column(
          children: [
             _appBar()
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return  Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
      
          Icon(Icons.qr_code_scanner_rounded,size: 25,),

          Flexible(
            child: Container(
                  margin: EdgeInsets.only(left: 8),
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
    
    // ListTile(
    //   leading:const Icon(
    //       Icons.qr_code_scanner_outlined,
    //       size: 25,
    //     ),
    //     title:  Align(
    //       child: Row(            
    //         children: [
    //           Container(
                
    //             height: 40,
    //             width: MediaQuery.of(context).size.width *0.68,
    //             alignment: Alignment.center,
    //             decoration: BoxDecoration(
              
    //                 borderRadius: BorderRadius.circular(5),
    //                 border: Border.all(color: AppConstant.appMaincolor,strokeAlign: BorderSide.strokeAlignCenter,width: 2)),
    //             child: Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 const Row(
    //                   children: [
    //                     Align(
    //                       alignment: Alignment.center,
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(right: 4,left: 5),
    //                         child: Icon(
    //                           Icons.linked_camera_outlined,
    //                           size: 25,
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(width: 2),
    //                     Text("Cars for Kids",style: TextStyle(fontSize: 12),),
    //                   ],
    //                 ),
                    
              
                   
    //                  Container(
    //                   height: 35,
    //                   width: 60,
    //                   margin: const EdgeInsets.only(right: 1),
    //                   decoration: BoxDecoration(
    //                     color: AppConstant.appMaincolor,
    //                     borderRadius: BorderRadius.circular(5)
    //                   ),
    //                  child:const Center(child: Text("Search",style:TextStyle(color: Colors.white,fontSize: 13) ,)),
    //                  )
                     
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     trailing: const Padding(
    //       padding:  EdgeInsets.only(left: 4,right: 4),
    //       child: Icon(Icons.account_balance_wallet_outlined),
    //     ), 
    // );
    
    
    
  }
}
