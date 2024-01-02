import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/MyDrawer.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text("Profile"),backgroundColor: Colors.yellow,),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://cdn4.iconfinder.com/data/icons/business-conceptual-part1-1/513/business-man-512.png'),
          ),
          ListTile(
            title: Text("Praful Deshmukh"),
            leading: Icon(Icons.person_outline),
          ),
          ListTile(
            title: Text("prafuldeshmukh068@gmail.com"),
            leading: Icon(Icons.email_outlined),
          ),
          ListTile(
            title: Text("+919359407730"),
            leading: Icon(Icons.phone_outlined),
          ),
          ListTile(
            title: Text("78 Ambika Nagar Narsala Road Nagpur 440034"),
            leading: Icon(Icons.person_outline),
          ),
        ],
      )
    );
  }
}
