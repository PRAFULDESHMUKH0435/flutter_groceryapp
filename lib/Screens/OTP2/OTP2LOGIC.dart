import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/OTP2/otp2.dart';

class OTP2LOGIC {
  sendotptouser(String phone,BuildContext context) async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential){},
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            print('The provided phone number is not valid.');
          }
          // Handle other errors
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OTP2(verificationId: verificationId)));
        },
        codeAutoRetrievalTimeout: (String verificationId){

        });
  }
}