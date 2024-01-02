import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/LoginScreen.dart';
import 'package:flutter_groceryapp/Screens/ProfileScreen.dart';
import 'package:flutter_groceryapp/Screens/WishListScreen.dart';
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
              const CircleAvatar(
                radius: 80,
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
              children:  [
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home_outlined),
                ),
                ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.person_outline),
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen())),
                ),
                ListTile(
                  title: Text('Category'),
                  leading: Icon(Icons.category_outlined),
                ),
                ListTile(
                    title: Text('WishList'),
                  leading: Icon(Icons.favorite_outline),
                  onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>WishListScreen()));
                  },
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
                ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.logout),
                  onTap: (){
                    final user = FirebaseAuth.instance;
                    print(user);
                    user.signOut();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
                  },
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
