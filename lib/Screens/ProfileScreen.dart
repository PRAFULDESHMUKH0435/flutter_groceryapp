import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Providers/ProfileProvider.dart';
import 'package:provider/provider.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);
    profile.FetchUserDetails();
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
