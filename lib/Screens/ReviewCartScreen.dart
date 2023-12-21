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
      body: ListView(
        children: [
          SingleContainer(false),
          SingleContainer(false)
        ],
      ),
    );
  }
}
