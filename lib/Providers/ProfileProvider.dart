import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider with ChangeNotifier{

   String username="";
   String useremail="";
   String useruid="";
   String userphotourl="";
   String userphonephonenumber="";

  FetchUserDetails() async{

    final ref = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    username=ref.get("UserName");
    useremail=ref.get("UserEmail");
    useruid=ref.get("UserUid");
    userphotourl=ref.get("UserPhotoUrl");
    userphonephonenumber=ref.get("UserPhone");

    print(username);
  }
}