import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});



  Future<void> _launchUrl(BuildContext context,Uri uri) async {
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(uri.data.toString())));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Contact Us"),
      ),
      body:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 55),
            InkWell(
              onTap: () {
                final Uri uri = Uri.parse('tel:+919359407730');
               _launchUrl(context,uri);
              },
              child: Container(
                height: 150,
                child: Image.asset('assets/Images/phone.png'),
              ),
            ),
            SizedBox(height: 55),
            InkWell(
              onTap: () {
                final Uri uri = Uri.parse('https://api.whatsapp.com/send?phone=+919359407730');
                _launchUrl(context,uri);
              },
              child: Container(
                height: 150,
                child: Image.asset('assets/Images/whatsapp.png'),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
