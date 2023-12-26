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


   RemoveItemFromWishlist(String id){
     for(int i=0;i<wishlistitems.length;i++){
       if(wishlistitems[i].proid==id){
         wishlistitems.removeAt(i);
         break;
       }
     }
   }
}