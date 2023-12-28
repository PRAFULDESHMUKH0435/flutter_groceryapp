import 'package:flutter/material.dart';
class PaymentSummarySingleContainer extends StatelessWidget {
  String title1;
  String title2;
  PaymentSummarySingleContainer({required this.title1,required this.title2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0,vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title1,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          Text(title2,style: TextStyle(fontSize: 18))
        ],),
    );
  }
}
