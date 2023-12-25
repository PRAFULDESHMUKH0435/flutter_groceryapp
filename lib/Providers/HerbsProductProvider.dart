import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/HerbsProductModel.dart';

class HerbsProductProvider with ChangeNotifier{

  List<HerbsProductModel> Herbsproductlist =[];
  List<HerbsProductModel> Freshfruitslist =[];
  List<HerbsProductModel> allitemslist=[];
  List<HerbsProductModel> updatedsearchlist=[];
  bool issearching = false;
  int num =1;

    FetchHerbsProductsData() async{
    QuerySnapshot ref =await FirebaseFirestore.instance.collection("HerbsProdcts").get();
    ref.docs.forEach((element) {
      HerbsProductModel  herbsproductmodel = HerbsProductModel(
          productname: element.get("productname"),
          productimage: element.get("productimage"),
          productprice: element.get("productprice"),
          proid: element.get("proid"),
      );
      Herbsproductlist.add(herbsproductmodel);
      allitemslist.add(herbsproductmodel);
    });
    notifyListeners();
  }
  
    FetchFreshFruits() async{
       QuerySnapshot ref = await FirebaseFirestore.instance.collection("FreshFruits").get();
       ref.docs.forEach((element) {
           HerbsProductModel _freshfruitsmodel = HerbsProductModel(
               productname: element.get("productname"),
               productimage: element.get("productimage"),
               productprice: element.get("productprice"),
               proid: element.get("proid"),
           );
           Freshfruitslist.add(_freshfruitsmodel);
           allitemslist.add(_freshfruitsmodel);
       });
       notifyListeners();
    }

    List<HerbsProductModel> SearchProducts(String val,List<HerbsProductModel> list){
       print("Executing");
       print(list.length);
       return updatedsearchlist;
    }

}