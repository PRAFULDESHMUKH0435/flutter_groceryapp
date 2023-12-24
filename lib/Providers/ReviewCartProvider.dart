import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Models/CartModel.dart';
class ReviewCartProvider with ChangeNotifier{

   List<CartModel>  cartlist =[];
   AddItemToCart(CartModel model){
     cartlist.add(
       CartModel(
           cartname: model.cartname,
           cartid: model.cartid,
           cartimage: model.cartimage,
           cartprice: model.cartprice,
           cartquantity: model.cartquantity),
       );
     notifyListeners();
   }

   DeletItemFromCart(String itemname){
     for(int i=0;i<cartlist.length;i++){
       if(cartlist[i].cartname==itemname){
         cartlist.removeAt(i);
         break;
       }
     }
     notifyListeners();
   }

   OpenDialogBox(BuildContext context,String itemname){
     return showDialog(context: context,
         builder: (context){
             return AlertDialog(
               title: Text("Delete"),
                 content: Text("Are You Sure You Want To Remove $itemname From Cart"),
               actions: [
                 ElevatedButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text("No")),
                 ElevatedButton(onPressed: (){
                   print(cartlist.length);
                   DeletItemFromCart(itemname);
                   Navigator.of(context).pop(true);
                 }, child: Text("Yes")),
               ],
             );
         });
   }

}