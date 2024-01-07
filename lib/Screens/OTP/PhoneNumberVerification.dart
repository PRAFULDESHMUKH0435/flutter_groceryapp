import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/OTP/VerifyOTP.dart';
import 'package:flutter_groceryapp/Services/FirebaseServices.dart';

import 'OTPLOGIC.dart';
class PhoneNumberVerification extends StatelessWidget {
   PhoneNumberVerification({super.key});
   OTPVALIDATIONANDVERIFICATION otpvalidation = OTPVALIDATIONANDVERIFICATION();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Authentication"),
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
                  hintText: "+910000000000",
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
              controller: controller,
            ),
          ),
            ElevatedButton(onPressed: (){
              if(controller.text.isEmpty || controller.text.length!=10){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Enter Valid 10 Digit Mobile Number")));
              }else{
                String temp ="+91${controller.text.toString()}";
                if(temp.length==13){
                  print("Mobile Number Is : ${temp}");
                  otpvalidation.verifyuserwithphone(temp,context);
                  controller.clear();
                }else{
                  print("INVALID MOBILE NUMBER");
                }
              }

            }, child: Text("Send OTP")),
          ],
        ),
      ),
    );
  }
}
