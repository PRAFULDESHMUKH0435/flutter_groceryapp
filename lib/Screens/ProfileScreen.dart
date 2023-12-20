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
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 120,
                color: Colors.yellow,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 30,top: 70),
            child: CircleAvatar(
              backgroundColor: Colors.yellow,
              radius: 50,
              backgroundImage: NetworkImage('https://www.pngitem.com/pimgs/m/404-4042710_circle-profile-picture-png-transparent-png.png'),
            ),
          )
        ],
      ),
    );
  }
}
