import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/MyDrawer2.dart';
import 'package:flutter_groceryapp/Providers/ProfileProvider.dart';
import 'package:provider/provider.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {




  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);
    profile.FetchUserDetails();
    return Scaffold(
      drawer: MyDrawer2(),
      appBar: AppBar(title: Text("Profile"),backgroundColor: Colors.yellow,),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://cdn4.iconfinder.com/data/icons/business-conceptual-part1-1/513/business-man-512.png'),
          ),
          ListTile(
            title: Text(profile.username),
            leading: Icon(Icons.person_outline),
          ),
          ListTile(
            title: Text(profile.useremail),
            leading: Icon(Icons.email_outlined),
          ),
          ListTile(
            title: Text(profile.userphonephonenumber),
            leading: Icon(Icons.phone_outlined),
          ),
          ListTile(
            title: Text(profile.useruid),
            leading: Icon(Icons.person_outline),
          ),
        ],
      )
    );
  }
}
