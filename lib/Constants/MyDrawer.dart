import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow,
      child: Column(
        children: [
          DrawerHeader(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white70,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.yellow,
                  backgroundImage: NetworkImage('https://www.pngitem.com/pimgs/m/404-4042710_circle-profile-picture-png-transparent-png.png'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Praful Deshmukh',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  ElevatedButton(onPressed: (){}, child: Text('Login'))
                ],
              )
            ],
          )),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home_outlined),
                ),
                ListTile(
                  title: Text('Category'),
                  leading: Icon(Icons.category_outlined),
                ),
                ListTile(
                  title: Text('About'),
                  leading: Icon(Icons.info_outline),
                ),
                ListTile(
                  title: Text('Contact'),
                  leading: Icon(Icons.phone_outlined),
                ),
                ListTile(
                  title: Text('Shop'),
                  leading: Icon(Icons.shopping_bag_outlined),
                ),
                ListTile(
                  title: Text('My Cart'),
                  leading: Icon(Icons.add_shopping_cart),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
