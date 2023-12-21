import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/singlecontainer.dart';
class SearchItemScreen extends StatelessWidget {
  const SearchItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.filter_alt_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0),
                child: Text("Items",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search For Items In Store",
                  suffixIcon: Icon(Icons.search_outlined),
                  fillColor: Colors.grey.shade400,
                  filled: true
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SingleContainer(true),
                  SingleContainer(true),
                  SingleContainer(true),
                  SingleContainer(true),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
