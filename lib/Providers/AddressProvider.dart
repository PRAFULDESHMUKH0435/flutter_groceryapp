import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Models/AddressModel.dart';

class AddressProvider with ChangeNotifier{
   int count = 0;
   checkcount() async{
    final ref = await FirebaseFirestore.instance.collection("Address").get();
    count=ref.size;
    notifyListeners();
  }

   DisableRemainingAddresses() async{
    final ref = await FirebaseFirestore.instance.collection("Address").get();
   }

   AddUserAddressToDB(AddressModel model,BuildContext context) async{

     final ref = await FirebaseFirestore.instance.collection("Address").doc(model.ID);
     if(count>0){
       DisableRemainingAddresses();
     }
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
       "isselected":model.isselected.toString(),
       "DeliveryAddressType":model.deliveryaddresstype
     }).then((value){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User Address Saved Successfully")));
     }).onError((error, stackTrace){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error ${error.toString()}")));
     });
     checkcount();
     notifyListeners();
     return ref;


   }
}