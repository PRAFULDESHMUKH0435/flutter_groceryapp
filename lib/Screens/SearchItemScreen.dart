import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/singlecontainer.dart';
import 'package:flutter_groceryapp/Providers/HerbsProductProvider.dart';
import 'package:provider/provider.dart';

import '../Models/HerbsProductModel.dart';
class SearchItemScreen extends StatelessWidget {
  List<HerbsProductModel> searchlist =[];
  SearchItemScreen({required this.searchlist});



  @override
  Widget build(BuildContext context) {
    final searchprovider = Provider.of<HerbsProductProvider>(context);
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
                onChanged: (newvalue){
                  searchprovider.issearching=true;
                  searchprovider.SearchProducts(newvalue);
                },
                decoration: InputDecoration(
                  hintText: "Search For Items In Store",
                  suffixIcon: Icon(Icons.search_outlined),
                  fillColor: Colors.grey.shade400,
                  filled: true
                ),
              ),
            ),
              Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: searchprovider.allitemslist.length,
                    itemBuilder: (context,index){
                       return SingleContainer(true,searchprovider.allitemslist[index].productname,searchprovider.allitemslist[index].productprice.toString(),searchprovider.allitemslist[index].productimage);
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



// children: [
// SingleContainer(true),
// SingleContainer(true),
// SingleContainer(true),
// SingleContainer(true),
// ],