import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/HomeScreen.dart';
import 'package:flutter_groceryapp/Screens/SplashScreen.dart';

import 'Screens/LoginScreen.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
