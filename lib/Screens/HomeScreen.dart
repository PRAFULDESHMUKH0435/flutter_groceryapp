import 'package:flutter/material.dart';
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
              child: IconButton(icon: Icon(Icons.search_outlined),onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchItemScreen(searchlist:productprovider.allitemslist,))),),
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
      drawer: MyDrawer(),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchItemScreen(searchlist: productprovider.Herbsproductlist,)));
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
                      return  ReUsableContainer(productname:e.productname,productimageurl: e.productimage,productprice: e.productprice);
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchItemScreen(searchlist: productprovider.Freshfruitslist)));
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
                     return  ReUsableContainer(productname: fruits.productname, productimageurl: fruits.productimage,productprice:fruits.productprice);
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

//
// Container(
// height: 280,
// width: 200,
// margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(12.0)),
// color: Colors.white,
// ),
// child: Column(
// children: [
// Expanded(child: Image(image: NetworkImage(fruits.productimage),)),
// Expanded(child: Column(
// children: [
// Text(fruits.productname,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
// Text('${fruits.productprice}\$ /50 Gram',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Container(
// decoration: const BoxDecoration(
// color: Colors.transparent,
// borderRadius: BorderRadius.all(Radius.circular(12.0))
// ),
// child: const Row(children: [
// Text('50 Gram'),
// Icon(Icons.arrow_drop_down)
// ],),
// ),
// Container(
// decoration: const BoxDecoration(
// color: Colors.white70,
// borderRadius: BorderRadius.all(Radius.circular(8.0))
// ),
// child: Row(children: [
// IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
// Text('1'),
// IconButton(onPressed: (){}, icon: Icon(Icons.add)),
// ],),)
// ],
// )
// ],))
// ],
// ),
// );