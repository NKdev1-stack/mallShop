import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Text_Form_Field extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  bool obsecureText;
  IconButton? IconforpasswordVisibility;
  
   Text_Form_Field({super.key,required this.controller, required this.hintText,  required this.obsecureText, this.IconforpasswordVisibility});

  @override
  Widget build(BuildContext context) {
    return   Container(
    
               margin: const EdgeInsets.only(top: 25,left: 20,right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                 color: Colors.grey.shade200 
                ),
              child: TextFormField(
                controller: controller,
                obscureText: obsecureText,
                decoration:  InputDecoration(
                  hintText: hintText,
                  contentPadding: const EdgeInsets.all(20 ),
                  suffixIcon:  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: InkWell(
                      
                      onTap: (){},
                      child: IconforpasswordVisibility??Text("")),
                  ),
                  border: InputBorder.none,
                  
                 
                ),
              ),
            );
  }
}