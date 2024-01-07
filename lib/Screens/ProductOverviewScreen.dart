import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Providers/WishListProvider.dart';
import 'package:flutter_groceryapp/Screens/WishListScreen.dart';
import 'package:provider/provider.dart';

import '../Services/CommonServices.dart';
class ProductOverViewScreen extends StatefulWidget {
  String productname;
  String productimageurl;
  int productprice;
  String productid;
  ProductOverViewScreen({required this.productname,required this.productimageurl,required this.productprice,required this.productid});

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  String defaultvalue = 'Basil';
  String quantity="50Gram";

  CommonServices commonServices = CommonServices();
  @override
  Widget build(BuildContext context) {
    final wishlistprovider = Provider.of<WishListProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      appBar: AppBar(
        title: Text("Product OverView "),
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WishListScreen()));
    }, icon: Icon(Icons.favorite_outlined)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              title: Text(widget.productname,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              subtitle: Text('\$${widget.productprice}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.green),),
            ),
            Container(
                height: 150,
                child: Center(child: Image(image: NetworkImage(widget.productimageurl)))),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 5.0),
              child: Text('Available Options',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Container(height: 50,
              padding: EdgeInsets.only(bottom: 10.0),
              child: Center(
                child: RadioListTile(
                  title: Text("50 Gram",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  value: "50Gram",
                  groupValue: quantity,
                  onChanged: (newvalue){
                    setState(() {
                      quantity=newvalue.toString();
                      print(quantity);
                    });
                  },
                  secondary: ElevatedButton(
                    child: Text("+ Add"),
                    onPressed: (){},
                  )
                ),
              ),
            ),
            Text('About This Product',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text('Basil is an annual herbaceous plant in the mint family Lamiaceae. It has square stems with leaves that grow on opposite sides, and the leaves are rounded, slightly cupped, and curve to form at point at the tip. The leaves are generally light green, although some varieties have reddish or purplish leaves.',style: TextStyle(fontSize: 18),)))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: ()  {
                  // print(widget.productname);
                  wishlistprovider.checkalreadypresentornot(widget.productname);
                  if(wishlistprovider.iswishlisted){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" ${widget.productname} Already Present In Wishlist Items")));
                  }else{
                    
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      wishlistprovider.temp.contains(widget.productid) ? Icon(Icons.favorite_outlined,color: Colors.red):Icon(Icons.favorite_outline,color: Colors.white70,),
                    SizedBox(width: 5,),
                    Text('Add To WishList',style: TextStyle(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold),)
                  ],),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.shopping_bag_outlined,color: Colors.white70,),
                    SizedBox(width: 5,),
                    Text('Go To Cart',style: TextStyle(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold),)
                  ],),
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}
