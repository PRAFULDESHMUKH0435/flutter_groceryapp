import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/WishListProvider.dart';

class SingleWishListItem extends StatelessWidget {
  String prodname;
  String proimage;
  int proprice;
  SingleWishListItem(
      {required this.prodname, required this.proimage, required this.proprice});


  @override
  Widget build(BuildContext context) {
    final wishlistprovider = Provider.of<WishListProvider>(context);
    print("WISHLIST BUILD METHOD");
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14.0)),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(wishlistprovider.wishlistitems[0].productimage),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  prodname,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$$proprice",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: () {},
              ))
        ],
      ),
    );
  }
}
