import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/singlecontainer.dart';
import '../Models/HerbsProductModel.dart';

class SearchItemScreen extends StatefulWidget {
  List<HerbsProductModel> searchitemslist =[];
  SearchItemScreen({required this.searchitemslist});
  String query ="";

  @override
  State<SearchItemScreen> createState() => _SearchItemScreenState();
}

class _SearchItemScreenState extends State<SearchItemScreen> {
  @override
  Widget build(BuildContext context) {

    List<HerbsProductModel> updatedlist=[];
    updatedlist=widget.searchitemslist;
    print("SEARCH ITEMS BUILD METHOD CALLED");
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
                  setState(() {
                    print(widget.query);
                    widget.query=newvalue;
                    updatedlist = widget.searchitemslist.where((element){
                      return element.productname.toLowerCase().contains(widget.query.toLowerCase());
                    }).toList();
                    widget.searchitemslist=updatedlist;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search For Items In Store",
                  suffixIcon: Icon(Icons.search_outlined),
                  fillColor: Colors.grey.shade400,
                  filled: true
                ),
              )
            ),
              Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: widget.searchitemslist.length,
                    itemBuilder: (context,index){
                       return SingleContainer(issearchscreen: true,prodname:widget.searchitemslist[index].productname,proprice:widget.searchitemslist[index].productprice.toString(),proimage:widget.searchitemslist[index].productimage,proid: widget.searchitemslist[index].proid);
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


