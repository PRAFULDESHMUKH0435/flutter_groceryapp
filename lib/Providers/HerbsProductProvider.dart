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
               productprice: element.get("productprice")
           );
           Freshfruitslist.add(_freshfruitsmodel);
           allitemslist.add(_freshfruitsmodel);
       });
       notifyListeners();
    }

    SearchProducts(String val,List<HerbsProductModel> list){
    print("Executing");
       for(int i=0;i<list.length;i++){
         if(list[i].productname.toLowerCase().contains(val.toLowerCase())){
           updatedsearchlist.add(HerbsProductModel(
               productname: list[i].productname,
               productimage: list[i].productimage,
               productprice: list[i].productprice)
           );
         }
       }
      notifyListeners();
    }

}