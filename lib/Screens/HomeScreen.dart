import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/constant.dart';
import '../Constants/Banner.dart';
import '../Constants/MyDrawer.dart';
import '../Constants/ReusableContainer.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      ///APPBAR
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: appbarcolor,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: CircleAvatar(
              child: IconButton(icon: Icon(Icons.search_outlined),onPressed: (){},),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: CircleAvatar(
              child: IconButton(icon: Icon(Icons.shopping_bag_outlined),onPressed: (){},),
            ),
          ),

        ],
      ),
      ///DRAWER
      drawer: MyDrawer(),
      /// BODY
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
          child: Column(
            children: [
              /// BANNER
               ReUsableBanner(),
              /// HERBS SEASONINGS ROW
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Herbs Seasonings",style: TextStyle(fontSize: 22),),
                    Text("View All",style: TextStyle(fontSize: 18,color: Colors.black45),),
                  ],
                ),
              ),
              /// HERBS SEASONINGS CONTAINER
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ReusableContainer(context),
                      ReusableContainer(context),
                      ReusableContainer(context),
                      ReusableContainer(context),
                      ReusableContainer(context),
                      ReusableContainer(context),
                    ],
                  ),
                ),
              ),
              /// FRESH FRUITS ROW
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Fresh Fruits ",style: TextStyle(fontSize: 22),),
                    Text("View All",style: TextStyle(fontSize: 18,color: Colors.black45),),
                  ],
                ),
              ),
              /// FRESH FRUITS CONTAINER
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ReusableContainer(context),
                      ReusableContainer(context),
                      ReusableContainer(context),
                      ReusableContainer(context),
                    ],
                  ),
                ),
              ),
              /// BANNER
              ReUsableBanner(),
            ],
          ),
        ),
      ),
    );
  }
}
