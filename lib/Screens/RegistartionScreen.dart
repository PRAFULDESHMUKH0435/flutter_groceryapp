import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/LoginScreen.dart';
import 'package:flutter_groceryapp/Screens/SignUpScreen.dart';

import 'HomeScreen.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _usernamecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
   final _emailcontroller = TextEditingController();
   final _addresscontroller = TextEditingController();

  bool isobsecured = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String? UserNameValidator(value){
    if(value.isEmpty){
      return "This Field Is Required";
    }
  }

  String? EmailValidator(value){
    if(value.isEmpty){
      return "This Field Is Required";
    }
    final bool emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if(!emailValid){
      return "Invalid  Email Address";
    }
  }

  String? PhoneValidator(value){
    if(value.isEmpty){
      return "This Field Is Required";
    }
    if(value.length!=10){
      return "Mobile Number Should Be 10 Digit Long";
    }
  }

  String? AddressValidator(value){
    if(value.isEmpty){
      return "This Field Is Required";
    }
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
                keyboardType: TextInputType.name,
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
                    label: Text("Full Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    hintText: "Enter Full Name",
                    filled: true,
                    fillColor: Colors.grey
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailcontroller,
                validator: EmailValidator,
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
                    label: Text("Email Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    hintText: "Enter Email Address",
                    filled: true,
                    fillColor: Colors.grey
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phonecontroller,
                validator: PhoneValidator,
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
                    label: Text("Phone",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    hintText: "Enter Mobile Number",
                    filled: true,
                    fillColor: Colors.grey
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              child: TextFormField(
                controller: _addresscontroller,
                validator: AddressValidator,
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
                    label: Text("Postal Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    hintText: "Enter Address ",
                    filled: true,
                    fillColor: Colors.grey
                ),
              ),
            ),
            InkWell(
              onTap: (){
                if(_formkey.currentState!.validate()){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All Fields Are Mandatory")));
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: Center(child: Text("Register",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
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
                  Text("Already Have An Account",style: TextStyle(fontSize: 16),),
                  InkWell(
                      onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                      },
                      child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
