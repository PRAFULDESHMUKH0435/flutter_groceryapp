import 'package:flutter/material.dart';
class MyDrawer2 extends StatelessWidget {
  const MyDrawer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow,
      child: Column(
        children: [
          DrawerHeader(child: Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(''),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Praful"),
                  Text("prafuldeshmukh068@gmail.com")
              ],)
             ],)),
          Column(
            children: [
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home_outlined),
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
