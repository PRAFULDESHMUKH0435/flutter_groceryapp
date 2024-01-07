import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/HomeScreen.dart';
import 'package:flutter_groceryapp/Screens/RegistartionScreen.dart';
import 'package:flutter_groceryapp/Services/FirebaseServices.dart';

import '../Services/GoogleSignIn.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

    final _usernamecontroller = TextEditingController();
    final _passwordcontroller = TextEditingController();
    bool isobsecured = true;
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    FirebaseServices firebaseservices = FirebaseServices();

  String? UserNameValidator(value){
    if(value.isEmpty){
      return "This Field Is Required";
    }
    return null;
  }

  String? PasswordValidator(value){
    if(value.isEmpty){
      return "This Field Is Required";
    }
    return null;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              child: TextFormField(
                controller: _usernamecontroller,
                validator: UserNameValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration:const InputDecoration(
                  suffixIcon: Icon(Icons.person_outline),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                    borderSide: BorderSide(color: Colors.white70)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                    borderSide: BorderSide(color: Colors.green)
                  ),
                  label: Text("UserName",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  hintText: "Enter UserName",
                  filled: true,
                  fillColor: Colors.grey
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: isobsecured,
                controller: _passwordcontroller,
                validator: PasswordValidator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  suffixIcon: IconButton(icon:isobsecured?Icon(Icons.visibility_off_outlined):Icon(Icons.remove_red_eye),onPressed: (){
                    setState(() {
                      isobsecured=!isobsecured;
                    });
                  }),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                    borderSide: BorderSide(color: Colors.white70)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                    borderSide: BorderSide(color: Colors.green)
                  ),
                  label: Text("Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  hintText: "Enter Password",
                  filled: true,
                  fillColor: Colors.grey
                ),
              ),
            ),
            InkWell(
              onTap: (){
                if(_formkey.currentState!.validate()){
                 firebaseservices.LoginUser(_usernamecontroller.text.toString(), _passwordcontroller.text.toString(),context);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All Fields Are Mandatory")));
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: Center(child: Text("Login",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.all(Radius.circular(14.0))
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Don't Have An Account",style: TextStyle(fontSize: 16),),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                      },
                      child: Text("Create One",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Text("Sign Up Using ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap:(){
                      Authentication.signInWithGoogle(context: context);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      child:  Image(image: AssetImage('assets/Images/google.png')),
                    ),
                  ),
                  SizedBox(width: 20,),
                  InkWell(
                     onTap: (){

                     },
                    child: Container(
                      height: 50,
                      width: 50,
                      child:  Image(image: AssetImage('assets/Images/facebook.png')),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
