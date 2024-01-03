import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_groceryapp/Models/UserModel.dart';

class ProfileProvider with ChangeNotifier{


   String username="";
   String useremail="";
   String useruid="";
   String userphotourl="";
   String userphonephonenumber="";

  FetchUserDetails() async{
    final ref = await FirebaseFirestore.instance.collection("Users");
    ref.doc(FirebaseAuth.instance.currentUser!.uid).snapshots().forEach((element) {
       UserModel(
           username: element.get("UserName"),
           useremail: element.get("UserEmail"),
           useruid: element.get("UserUid"),
           userphotourl: element.get("UserPhotoUrl"),
           userphonephonenumber: element.get("UserPhone"));
    });
  }
}