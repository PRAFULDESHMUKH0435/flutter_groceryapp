import 'package:flutter/foundation.dart';
import 'package:flutter_groceryapp/Models/WishListModel.dart';
class WishListProvider with ChangeNotifier{

  List<WishListModel> wishlistitems =[];

   AddItemToWishList(String proname,String proimage,int proprice){
     wishlistitems.add( WishListModel(
             productname: proname,
             productimage: proimage,
             productprice: proprice
         ));
     notifyListeners();
   }
}