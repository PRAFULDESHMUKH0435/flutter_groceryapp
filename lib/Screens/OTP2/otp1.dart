import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/OTP2/OTP2LOGIC.dart';


class OTP1 extends StatelessWidget {
  OTP1({super.key});

  OTP2LOGIC logic = OTP2LOGIC();
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
                  logic.sendotptouser(temp, context);
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
