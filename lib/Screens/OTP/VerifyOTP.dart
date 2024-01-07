import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/HomeScreen.dart';

import 'OTPLOGIC.dart';
class VerifyOTP extends StatelessWidget {
  String verificationId;
   VerifyOTP({super.key,required this.verificationId});
   final otpcontroller = TextEditingController();
   OTPVALIDATIONANDVERIFICATION otpvalidation = OTPVALIDATIONANDVERIFICATION();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Verify OTP"),
        backgroundColor: Colors.yellow,
      ),
      body: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter OTP Here",
                  fillColor: Colors.grey,
                  filled: true,
                  prefixIcon: Icon(Icons.phone),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  ),
                  focusedBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                  ),
                ),
                keyboardType: TextInputType.phone,
                controller: otpcontroller,
              ),
            ),
            ElevatedButton(onPressed: () async{
              String temp =otpcontroller.text.toString();
              final credential = PhoneAuthProvider.credential(
                  verificationId: verificationId,
                  smsCode: otpcontroller.text.toString());
              try{
                await FirebaseAuth.instance.signInWithCredential(credential);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              }catch(e){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()),duration: Duration(seconds: 5),));
              }
            }, child: Text("Verify OTP")),
          ],
        ),
      ),
    );
  }
}
