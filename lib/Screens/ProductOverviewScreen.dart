import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Providers/WishListProvider.dart';
import 'package:provider/provider.dart';
class ProductOverViewScreen extends StatefulWidget {
  String productname;
  String productimageurl;
  int productprice;
  ProductOverViewScreen({required this.productname,required this.productimageurl,required this.productprice});

  @override
  State<ProductOverViewScreen> createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  String defaultvalue = 'Basil';
  @override
  Widget build(BuildContext context) {
    final wishlistprovider = Provider.of<WishListProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      appBar: AppBar(
        title: Text("Product OverView "),
        backgroundColor: Colors.yellow,
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
            Container(height: 40,color: Colors.red,),
            Text('About This Product',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Expanded(
                child: Text('Basil is an annual herbaceous plant in the mint family Lamiaceae. It has square stems with leaves that grow on opposite sides, and the leaves are rounded, slightly cupped, and curve to form at point at the tip. The leaves are generally light green, although some varieties have reddish or purplish leaves.',style: TextStyle(fontSize: 18),))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: (){
                  wishlistprovider.AddItemToWishList(widget.productname,widget.productimageurl,widget.productprice);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${widget.productname} Added To Wishlist")));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.favorite_outline,color: Colors.white70,),
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
