import 'package:flutter/material.dart';
import 'package:mallshop/Utils/app_constant.dart';

class HeadingWidget extends StatelessWidget {
  final String title,subtitle,buttonText;
  final VoidCallback onTap;

  const HeadingWidget({super.key, required this.title, required this.subtitle, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: ListTile(
        title: Text(title ,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        subtitle: Text(subtitle),
        trailing: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.sizeOf(context).height *0.04,
            width: MediaQuery.sizeOf(context).width *0.25,
            decoration:  BoxDecoration(
              border: Border.all(color: AppConstant.appMaincolor),
              borderRadius: BorderRadius.circular(20)
              
            ),
            child: Text(buttonText,style: const TextStyle(fontSize: 12.0),),
          ),
        ),
      ),
    );
  }
}
