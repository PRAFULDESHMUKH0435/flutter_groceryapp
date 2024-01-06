import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Providers/AddressProvider.dart';
import 'package:flutter_groceryapp/Providers/ProfileProvider.dart';
import 'package:flutter_groceryapp/Providers/ReviewCartProvider.dart';
import 'package:flutter_groceryapp/Providers/FreshFruitsProvider.dart';
import 'package:flutter_groceryapp/Providers/HerbsProductProvider.dart';
import 'package:flutter_groceryapp/Providers/WishListProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_groceryapp/Screens/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'dart:io';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCuooJswwVdnW0japDaZ-CN4woG1Pw49xQ",
      appId: "1:1004979246500:android:b2e9f19f855fac9c145d31",
      messagingSenderId: "1004979246500",
      projectId: "grocery-877e5",
    ),
  ): await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>HerbsProductProvider()),
          ChangeNotifierProvider(create: (_)=>FreshFruitsProvider()),
          ChangeNotifierProvider(create: (_)=>ReviewCartProvider()),
          ChangeNotifierProvider(create: (_)=>WishListProvider()),
          ChangeNotifierProvider(create: (_)=>ProfileProvider()),
          ChangeNotifierProvider(create: (_)=>AddressProvider())
        ],
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),);
  }
}
