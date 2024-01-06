import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/MyDrawer2.dart';
import 'package:flutter_groceryapp/Constants/ReusableContainer.dart';
import 'package:flutter_groceryapp/Constants/constant.dart';
import 'package:flutter_groceryapp/Providers/HerbsProductProvider.dart';
import 'package:flutter_groceryapp/Providers/ReviewCartProvider.dart';
import 'package:flutter_groceryapp/Screens/ReviewCartScreen.dart';
import 'package:flutter_groceryapp/Screens/SearchItemScreen.dart';
import 'package:flutter_groceryapp/Services/FirebaseServices.dart';
import 'package:provider/provider.dart';
import '../Constants/Banner.dart';
import '../Providers/AddressProvider.dart';
import '../Providers/ProfileProvider.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  FirebaseServices services = FirebaseServices();
  
  @override
  void initState() {
    /// LOADING ALL REFERENCE DATA
    final productprovider = Provider.of<HerbsProductProvider>(context,listen: false);
    final profileprovider = Provider.of<ProfileProvider>(context,listen: false);
    final addressprovider = Provider.of<AddressProvider>(context,listen: false);
    addressprovider.GetAddressCount();
    addressprovider.GetAddress();
    profileprovider.FetchUserDetails();
    productprovider.FetchHerbsProductsData();
    productprovider.FetchFreshFruits();
    ///
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productprovider=Provider.of<HerbsProductProvider>(context);
    print("BUILD FUNCTION EXECUTED");

    return WillPopScope(
       onWillPop: ()=>_OnBackPressed(context),
      child: Scaffold(
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
      ),
    );


  }


  Future<bool> _OnBackPressed(BuildContext context) async{
      bool? exitapp = await showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
             title: Text("Exit"),
             content: Text("Are You Sure You Want To Exit"),
              actions: [
                OutlinedButton(onPressed: ()=>Navigator.of(context).pop(false), child: Text("No")),
                OutlinedButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text("Yes")),
              ],
            );
          });
      return exitapp??false;
  }
}

