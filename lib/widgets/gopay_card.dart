import 'package:flutter/material.dart';
import 'package:gojekv2/widgets/custom_text.dart';

Widget GopayCard(IconData icon,String text){
  return Container(
    margin: EdgeInsets.only(left: 10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),),
        child: Container(
          margin: EdgeInsets.all(6),
        child: Icon(icon,color: Color(0xff176ba3),),
          ),
        ),
        customText2(text,12,Colors.white)
      ],
    ),
  );
}