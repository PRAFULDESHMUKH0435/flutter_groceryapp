import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Services/CommonServices.dart';
import 'package:provider/provider.dart';
import '../Providers/WishListProvider.dart';

class SingleWishListItem extends StatefulWidget {
  String prodname;
  String proimage;
  int proprice;
  String proid;
  SingleWishListItem(
      {required this.prodname, required this.proimage, required this.proprice,required this.proid});

  @override
  State<SingleWishListItem> createState() => _SingleWishListItemState();
}

class _SingleWishListItemState extends State<SingleWishListItem> {


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
                  widget.prodname,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${widget.proprice}",
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
                onPressed: () {

                },
              ))
        ],
      ),
    );
  }
}
