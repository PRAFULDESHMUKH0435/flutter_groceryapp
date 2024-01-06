import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Providers/AddressProvider.dart';
import 'package:provider/provider.dart';


class CommonServices {
     bool isaddressselected = false;
     final _fullnamecontroller = TextEditingController();
     final _addresscontroller = TextEditingController();
     final _mobilecontroller = TextEditingController();

     GetCurrentUserLocation(){
        Timer(Duration(seconds: 5), () {
           Center(child: CircularProgressIndicator());
        });
     }


     EditDialog(BuildContext context,String fullname,String address,String phone){
       _fullnamecontroller.text=fullname;
       _mobilecontroller.text=phone;
       _addresscontroller.text=address;
       showDialog(
           context: context,
           builder: (context){
             return AlertDialog(
               title: Text("Edit Delivery Address"),
               content: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                   TextField(
                     decoration: InputDecoration(
                       icon: Icon(Icons.person),
                     ),
                     controller: _fullnamecontroller,
                   ),
                   TextFormField(
                     decoration: InputDecoration(
                       icon: Icon(Icons.location_on),
                     ),
                     maxLines: 2,
                     controller: _addresscontroller,
                   ),
                   TextFormField(
                     decoration: InputDecoration(
                       icon: Icon(Icons.phone),
                     ),
                     controller: _mobilecontroller,
                   ),

                 ],
               ),
               actions: [
                 OutlinedButton(onPressed: ()=>Navigator.pop(context), child: Text("Cancel")),
                 OutlinedButton(onPressed: (){
                    AddressProvider.UpdateAddress(_fullnamecontroller.text.toString(),_addresscontroller.text.toString(),_mobilecontroller.text.toString());
                    Navigator.pop(context);
                    _fullnamecontroller.clear();
                    _addresscontroller.clear();
                    _mobilecontroller.clear();
                 }, child: Text("Update")),
               ],
             );
           });
     }
}