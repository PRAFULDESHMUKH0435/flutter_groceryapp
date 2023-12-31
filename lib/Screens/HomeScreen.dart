import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/MyDrawer2.dart';
import 'package:flutter_groceryapp/Constants/ReusableContainer.dart';
import 'package:flutter_groceryapp/Constants/constant.dart';
import 'package:flutter_groceryapp/Providers/HerbsProductProvider.dart';
import 'package:flutter_groceryapp/Screens/ReviewCartScreen.dart';
import 'package:flutter_groceryapp/Screens/SearchItemScreen.dart';
import 'package:provider/provider.dart';
import '../Constants/Banner.dart';
import '../Constants/MyDrawer.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    final productprovider = Provider.of<HerbsProductProvider>(context,listen: false);
    productprovider.FetchHerbsProductsData();
    productprovider.FetchFreshFruits();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productprovider=Provider.of<HerbsProductProvider>(context);
    print("BUILD FUNCTION EXECUTED");
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
              child: IconButton(icon: Icon(Icons.search_outlined),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchItemScreen(searchitemslist: productprovider.allitemslist,))),),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: CircleAvatar(
              child: IconButton(icon: Icon(Icons.shopping_bag_outlined),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewCartScreen())),),
            ),
          ),

        ],
      ),
      ///DRAWER
      drawer: MyDrawer2(),
      /// BODY
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0,vertical: 5.0),
          child: Column(
            children: [
              /// BANNER
               ReUsableBanner(),
              /// HERBS SEASONINGS ROW
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Herbs Seasonings",style: TextStyle(fontSize: 22),),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchItemScreen(searchitemslist: productprovider.Herbsproductlist)));
                        },
                        child: Text("View All",style: TextStyle(fontSize: 18,color: Colors.black45),)),
                  ],
                ),
              ),
              /// HERBS SEASONINGS CONTAINER
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: productprovider.Herbsproductlist.map((e){
                      return  ReUsableContainer(productname:e.productname,productimageurl: e.productimage,productprice: e.productprice,proid:e.proid);
                    }).toList(),
                  ),
                ),
              ),
              /// FRESH FRUITS ROW
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Fresh Fruits ",style: TextStyle(fontSize: 22),),
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchItemScreen(searchitemslist: productprovider.Freshfruitslist,)));
                        },
                        child: Text("View All",style: TextStyle(fontSize: 18,color: Colors.black45),)),
                  ],
                ),
              ),
              /// FRESH FRUITS CONTAINER
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                   children: productprovider.Freshfruitslist.map((fruits){
                     return  ReUsableContainer(productname: fruits.productname, productimageurl: fruits.productimage,productprice:fruits.productprice,proid: fruits.proid);
                   }).toList(),
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

