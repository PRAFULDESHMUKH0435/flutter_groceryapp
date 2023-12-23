import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/singlecontainer.dart';
class ReviewCartScreen extends StatelessWidget {
  const ReviewCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Cart'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/Images/empty_cart.png'))
              ),
            ),
            Text("Your Cart Is Empty",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
