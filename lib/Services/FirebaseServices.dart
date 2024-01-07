import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/HomeScreen.dart';
import 'package:flutter_groceryapp/Screens/SignUpScreen.dart';

class FirebaseServices{

  static int count = 0;
  void CheckUserIsAlreadyLoggedInornot(BuildContext context) async{
    final user =await FirebaseAuth.instance.currentUser;
    print("USer Is $user");
    if(user==null){
      Timer(Duration(seconds: 5), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
      });
    }else{
      Timer(Duration(seconds: 5), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      });
    }
  }


  static void SaveUserData(User user) async{
    final ref =await FirebaseFirestore.instance.collection("Users").doc(user.uid);
    Map<String,dynamic> usermodel = {
      "UserName":user.displayName.toString(),
      "UserEmail":user.email.toString(),
      "UserPhone":user.phoneNumber.toString(),
      "UserUid":user.uid.toString(),
      "UserPhotoUrl":user.photoURL.toString(),
    };
    ref.set(usermodel)
      .then((value){
        print("USER DATA SAVED IS ${user}");
    }).onError((error, stackTrace){
        print("ERROR OCCURED ${error.toString()}");
    });

  }

  LoginUser(String uemail,String upassword,BuildContext context) async{
    final ref = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: uemail,
        password: upassword).then((value){
          print(value);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
       }).onError((error, stackTrace){
        print(error.toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
       });
  }



  SAVEUSERINFO(String uname,String uemail,String uphone,String uaddress,String upassword,BuildContext context) async{
    final ref = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid);
    ref.set({
      "UserName":uname,
      "UserEmail":uemail,
      "UserPhone ":uphone,
      "Address":uaddress,
      "Password":upassword,
      "UserUid":FirebaseAuth.instance.currentUser!.uid,
    }).then((value){
      print("success save user info");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
    }).onError((error, stackTrace){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
    });
  }


  RegisterUser(String uname,String uemail,String uphone,String uaddress,String upassword,BuildContext context) async{

    final ref = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: uemail,
        password: upassword).then((value){
          print(value);
          SAVEUSERINFO(uname,uemail,uphone,uaddress,upassword,context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
       }).onError((error, stackTrace){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString())));
       });
  }

   checkcount() async{
     final ref = await FirebaseFirestore.instance.collection("Address").get();
     count=ref.size;
  }





}