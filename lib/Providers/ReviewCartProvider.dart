import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Models/CartModel.dart';
class ReviewCartProvider with ChangeNotifier{

   List<CartModel>  cartlist =[];
   double totalprice = 0.0;
   AddItemToReviewCart(String proname,String proid,String proimage,int proprice,int count) async{
     Random random = new Random();
     int num = random.nextInt(60)+1;
     final ref =await FirebaseFirestore.instance.collection("CartItems").doc("Test").collection("MyCart").doc(proid).set(
       {
         "proid":proid,
         "productname":proname,
         "productimage":proimage,
         "productprice":proprice,
         "productcount":count,
       }
     );

   }

   FetchCartItems() async{
     List<CartModel> templist=[];
     final ref = await FirebaseFirestore.instance.collection("CartItems").doc("Test").collection("MyCart").get();
     ref.docs.forEach((element) {
       totalprice+=element.get("productprice")*element.get("productcount");
          CartModel cartModel = CartModel(
              cartname: element.get("productname"),
              cartid: element.get("proid"),
              cartimage: element.get("productimage"),
              cartprice: element.get("productprice"),
              cartquantity: element.get("productcount"),
          );
          templist.add(cartModel);
        },
     );
     cartlist=templist;
     notifyListeners();
   }

   DeletItemFromCart(String itemid) async{
     final ref =await FirebaseFirestore.instance.collection("CartItems").doc("Test").collection("MyCart").doc(itemid)
         .delete();
     notifyListeners();
   }

   OpenDialogBox(BuildContext context,String itemname,String id){
     return showDialog(context: context,
         builder: (context){
             return AlertDialog(
               title: Text("Delete"),
                 content: Text("Are You Sure You Want To Remove $itemname From Cart"),
               actions: [
                 ElevatedButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text("No")),
                 ElevatedButton(onPressed: (){
                   print(cartlist.length);
                   DeletItemFromCart(id);
                   FetchCartItems();
                   Navigator.of(context).pop(true);
                 }, child: Text("Yes")),
               ],
             );
         });
   }

}