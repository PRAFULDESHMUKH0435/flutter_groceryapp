import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Providers/ProfileProvider.dart';
import 'package:flutter_groceryapp/Screens/ProfileScreen.dart';
import 'package:provider/provider.dart';
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
              ),
              ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.person_outline),
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen())),
              ),
              ListTile(
                title: Text("About"),
                leading: Icon(Icons.info_outline),
              ),
              ListTile(
                title: Text("Contact"),
                leading: Icon(Icons.phone_outlined),
              ),
              ListTile(
                title: Text("Categories"),
                leading: Icon(Icons.category_outlined),
              ),
              ListTile(
                title: Text("Cart"),
                leading: Icon(Icons.shopping_bag_outlined),
              ),
            ],
          )
        ],
      ),
    );
  }
}
