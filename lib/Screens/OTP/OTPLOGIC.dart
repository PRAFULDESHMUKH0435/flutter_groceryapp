import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'VerifyOTP.dart';

class OTPVALIDATIONANDVERIFICATION {



  verifyuserwithphone(String phone,BuildContext context) async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) async {

        },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error : ${e.toString()}"),duration: Duration(seconds: 5),));
      },
      codeSent: (String verificationId, int? resendToken) async {
        // String smsCode = 'xxxx';
        // PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
        // await FirebaseAuth.instance.signInWithCredential(credential);
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Code Send Successfully ${smsCode}"),duration: Duration(seconds: 5),));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyOTP(verificationId: verificationId)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // print("retrieval");
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Retrieval ${verificationId}"),duration: Duration(seconds: 5),));
      },
    );
  }
}