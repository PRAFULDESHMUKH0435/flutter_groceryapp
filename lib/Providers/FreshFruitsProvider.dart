import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Models/FreshFruitsModel.dart';

class FreshFruitsProvider with ChangeNotifier{

  List<FreshFruitsModel> freshfruits =[];
  Future GetFreshFruits() async{
    print("GET FRUITS CALLED");
    final ref = await FirebaseFirestore.instance.collection("FreshFruits").get();
    ref.docs.forEach((element) {
      FreshFruitsModel _freshfuitsmodel = FreshFruitsModel(
          productimage: element.get("productimage"),
          productname: element.get("productname"),
          productprice: element.get("productprice")
      );
      freshfruits.add(_freshfuitsmodel);
      print("DATA $freshfruits");
    });
    notifyListeners();
  }


  List<FreshFruitsModel> GetFreshFruitsList(){
    return freshfruits;
  }
}