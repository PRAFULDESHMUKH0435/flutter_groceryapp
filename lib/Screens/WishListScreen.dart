import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constants/SingleWishListItem.dart';
import '../Providers/WishListProvider.dart';
class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistprovider = Provider.of<WishListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("WishlList"),
        backgroundColor: Colors.yellow,
      ),
      body: Consumer<WishListProvider>(
        builder: (context,child,value){
          return ListView.builder(
              itemCount: wishlistprovider.wishlistitems.length,
              itemBuilder: (context,index){
                return SingleWishListItem(prodname:wishlistprovider.wishlistitems[index].productname,proimage:wishlistprovider.wishlistitems[index].productimage,proprice:wishlistprovider.wishlistitems[index].productprice,);
              }
          );
        },
      ),
    );
  }
}
