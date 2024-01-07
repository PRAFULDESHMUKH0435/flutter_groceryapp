import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_groceryapp/Models/WishListModel.dart';
class WishListProvider with ChangeNotifier{

  List<WishListModel> wishlistitems =[];
  List<String> temp =[];
  bool iswishlisted = false;

   AddItemToWishList(String proname,String proimage,int proprice,String proid){
     wishlistitems.add( WishListModel(
             productname: proname,
             productimage: proimage,
             productprice: proprice,
             proid: proid
         ));
     notifyListeners();
   }


    checkalreadypresentornot(String name) async{
        final ref =await FirebaseFirestore.instance.collection("WishListItems").get();
        ref.docs.forEach((element) {
          if(element.get("productname")==name){
            print("${element.get("productname")} Is Already Present");
            return;
          }
        });
        notifyListeners();
  }

}