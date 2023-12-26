import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Constants/SingleWishListItem.dart';
import '../Providers/WishListProvider.dart';
class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    final wishlistprovider = Provider.of<WishListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("WishlList"),
        backgroundColor: Colors.yellow,
      ),
      body:wishlistprovider.wishlistitems.length==0?
      Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: NetworkImage('https://xplore.prayagrajxport.com/front_assets/images/empty_wishlist.png')),
            ],
          ),
        ),
      )

          :
      Consumer<WishListProvider>(
        builder: (context,child,value){
          return ListView.builder(
              itemCount: wishlistprovider.wishlistitems.length,
              itemBuilder: (context,index){
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
                              wishlistprovider.wishlistitems[index].productname,
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$${wishlistprovider.wishlistitems[index].productprice}",
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
                              print(wishlistprovider.wishlistitems[0].proid);
                              print(wishlistprovider.temp);
                              print(index);
                              wishlistprovider.temp.remove(wishlistprovider.wishlistitems[index].proid);
                              wishlistprovider.RemoveItemFromWishlist(wishlistprovider.wishlistitems[index].proid);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${wishlistprovider.wishlistitems[index].productname} Removed From  Wishlist")));
                              setState(() {
                                wishlistprovider.iswishlisted=false;
                              });
                            },
                          ))
                    ],
                  ),
                );
              }
          );
        },
      ),
    );
  }
}
