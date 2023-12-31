import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Providers/ProfileProvider.dart';
import 'package:flutter_groceryapp/Screens/ContactScreen.dart';
import 'package:flutter_groceryapp/Screens/LoginScreen.dart';
import 'package:flutter_groceryapp/Screens/ProfileScreen.dart';
import 'package:flutter_groceryapp/Screens/ReviewCartScreen.dart';
import 'package:flutter_groceryapp/Screens/SignUpScreen.dart';
import 'package:provider/provider.dart';

import '../Screens/WishListScreen.dart';
class MyDrawer2 extends StatelessWidget {
  const MyDrawer2({super.key});

  @override
  Widget build(BuildContext context) {
    final proprovider = Provider.of<ProfileProvider>(context);
    return  Drawer(
      backgroundColor: Colors.yellow,
      child: Column(
        children: [
          DrawerHeader(child: Row(
            children: [
              Expanded(
                  flex:1,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(proprovider.userphotourl),)),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(proprovider.username),
                    Text(proprovider.useremail)
                ],),
              )
             ],)),
          Column(
            children: [
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home_outlined),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.person_outline),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                },
              ),
              ListTile(
                title: Text("About"),
                leading: Icon(Icons.info_outline),
              ),
              ListTile(
                title: Text("Contact"),
                leading: Icon(Icons.phone_outlined),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactScreen()));
                },
              ),
              ListTile(
                title: Text("Categories"),
                leading: Icon(Icons.category_outlined),
              ),
              ListTile(
                title: Text("WishList"),
                leading: Icon(Icons.favorite_outline),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WishListScreen()));
                },
              ),
              ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_bag_outlined),
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>WishListScreen()));
                },
              ),

              ListTile(
                title: Text(" My Cart"),
                leading: Icon(Icons.shopping_cart_outlined),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewCartScreen()));
                },
              ),

              ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.logout),
                onTap: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
