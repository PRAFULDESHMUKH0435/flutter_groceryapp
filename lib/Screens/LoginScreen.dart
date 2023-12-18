import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/Images/background.png'),fit: BoxFit.cover)
        ),
        child: Center(
          child: Column(
            children: [
               Container(
                 height: 250,
                 margin: EdgeInsets.only(top: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sign In To Continue",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                    Text("Vegi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.white,shadows: [
                      BoxShadow(color: Colors.green,blurRadius: 5.0,offset: Offset(8, 2),spreadRadius: 5.0)
                    ]),)
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SignInButton(
                      Buttons.Apple,
                      text: "Sign up with Apple",
                      onPressed: () {},
                    ),
                    SizedBox(height: 20,),
                    SignInButton(
                      Buttons.Google,
                      text: "Sign up with Google",
                      onPressed: () {},
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
