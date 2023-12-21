import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Models/HerbsProductModel.dart';
class HerbsProductProvider with ChangeNotifier{

  List<HerbsProductModel> herbsproductlist =[];
  FetchHerbsProducts() async{
    final ref =await FirebaseFirestore.instance.collection("HerbsProdcts");

  }
}