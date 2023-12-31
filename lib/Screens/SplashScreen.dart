import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/constant.dart';
import 'package:flutter_groceryapp/Services/FirebaseServices.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseServices fservice = FirebaseServices();
    fservice.CheckUserIsAlreadyLoggedInornot(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: splashscreenbackgroundcolor,
        child: Center(child: Text("Vegi",style: TextStyle(
          fontSize: 80,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            BoxShadow(color: Colors.green,offset: Offset(5, 8),spreadRadius: 8.0,blurRadius: 5.0)
          ]
        ),)),
      ),
    );
  }
}
