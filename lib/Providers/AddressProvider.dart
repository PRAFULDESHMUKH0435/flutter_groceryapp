import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Models/AddressModel.dart';

class AddressProvider with ChangeNotifier{
    int count = 0;
    String username="";
    String useraddress="";
    String mobilenumber="";
    static String alternatemobilenumber="";
    static String DeliveryAddressType ="";

    GetAddressCount() async{
      final ref = await FirebaseFirestore.instance.collection("Address").get();
      count=ref.size;
      print("Hi $count");
    }


    GetAddress() async{
      final ref = await FirebaseFirestore.instance.collection("Address").get();
      ref.docs.forEach((element) { 
        username = element.get("Full Name");
        useraddress = element.get("Address");
        mobilenumber = element.get("MobileNumber");
        alternatemobilenumber = element.get("AlterMobile");
        DeliveryAddressType = element.get("DeliveryAddressType");
      });
      print("GETADDRESS LOADED");
    }

   AddUserAddressToDB(AddressModel model,BuildContext context) async{

     final ref = await FirebaseFirestore.instance.collection("Address").doc(FirebaseAuth.instance.currentUser!.displayName);
     ref.set({
       "Full Name":model.FirstName +" "+model.LastName,
       "MobileNumber":model.MobileNumber,
       "AlterMobile":model.AlterNateMobileNumber,
       "Address": model.Society +" "+model.Landmark +" "+model.Area +" "+model.City +" "+model.PinCode,
       "DeliveryAddressType":model.deliveryaddresstype
     }).then((value){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Address Saved Successfully")));
       count=1;
     }).onError((error, stackTrace){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error ${error.toString()}")));
     });
     notifyListeners();
     return ref;


   }


    static UpdateAddress(String uname,String uaddress,String uphone) async{
      final ref = await FirebaseFirestore.instance.collection("Address").doc(FirebaseAuth.instance.currentUser!.displayName);
      ref.set({
        "Full Name":uname,
        "MobileNumber":uphone,
        "Address":uaddress,
        "AlterMobile":alternatemobilenumber,
        "DeliveryAddressType":DeliveryAddressType,
      });
    }

}