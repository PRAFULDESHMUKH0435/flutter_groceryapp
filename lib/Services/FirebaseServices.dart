import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Models/AddressModel.dart';
import 'package:flutter_groceryapp/Screens/HomeScreen.dart';
import 'package:flutter_groceryapp/Screens/LoginScreen.dart';

class FirebaseServices{

  static int count = 0;
  void CheckUserIsAlreadyLoggedInornot(BuildContext context) async{

    final user =await FirebaseAuth.instance.currentUser;
    print("USer Is $user");
    if(user==null){
      Timer(Duration(seconds: 5), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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


   checkcount() async{
     final ref = await FirebaseFirestore.instance.collection("Address").get();
     count=ref.size;
  }

  AddUserAddressToDB(AddressModel model,BuildContext context) async{

    final ref = await FirebaseFirestore.instance.collection("Address").doc(model.ID);
    ref.set({
      "FirstName":model.FirstName,
      "LastName":model.LastName,
      "MobileNumber":model.MobileNumber,
      "AlterMobile":model.AlterNateMobileNumber,
      "Society":model.Society,
      "Street":model.Street,
      "LandMark":model.Landmark,
      "City":model.City,
      "Area":model.Area,
      "PinCode":model.PinCode,
      "ID":model.ID,
      "DeliveryAddressType":model.deliveryaddresstype
    }).then((value){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Address Saved Successfully")));
    }).onError((error, stackTrace){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error ${error.toString()}")));
    });
    return ref;

  }
}