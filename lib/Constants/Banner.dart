import 'package:flutter/material.dart';
Widget ReUsableBanner(){
  return Container(
    height: 250,
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6eIvJc-_86CsNifm01By65uHm-1FU7n1bdw3sR-0qPodZa7DUskiCM6qEVGE1_4lVwGM&usqp=CAU'),fit: BoxFit.cover)
    ),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("30% Off ",style: TextStyle(fontSize: 30,color: Colors.black87,shadows: [
          BoxShadow(color: Colors.red,offset: Offset(2, 3),spreadRadius: 5.0)
        ]),),
        Text("On All Vegetables",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),)
      ],
    )
  );
}