import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/ReviewCartContainer.dart';
import 'package:provider/provider.dart';
import '../Providers/ReviewCartProvider.dart';
class ReviewCartScreen extends StatefulWidget {
  const ReviewCartScreen({super.key});

  @override
  State<ReviewCartScreen> createState() => _ReviewCartScreenState();
}

class _ReviewCartScreenState extends State<ReviewCartScreen> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    final reviewcartprovider = Provider.of<ReviewCartProvider>(context,listen: false);
    reviewcartprovider.FetchCartItems();
  }

  @override
  Widget build(BuildContext context) {
    final reviewcartprovider = Provider.of<ReviewCartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Cart'),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: reviewcartprovider.cartlist.length==0?  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/Images/empty_cart.png'))
              ),
            ),
            Text("Your Cart Is Empty",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
          ],
        ):ListView.builder(
            itemCount: reviewcartprovider.cartlist.length,
            itemBuilder: (context,index){
              print(reviewcartprovider.cartlist.length);
              return ReviewCartContainer(
                  cartimage: reviewcartprovider.cartlist[index].cartimage,
                  cartname: reviewcartprovider.cartlist[index].cartname,
                  cartprice: reviewcartprovider.cartlist[index].cartprice.toString(),
                  cartquanity: reviewcartprovider.cartlist[index].cartquantity.toString(),
                  cartid: reviewcartprovider.cartlist[index].cartid);
            }),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount",style: TextStyle(fontSize: 20),),
        subtitle: Text("\$${reviewcartprovider.totalprice}",style: TextStyle(color: Colors.green,fontSize: 18),),
        trailing: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(18.0))
          ),
          child: MaterialButton(
            child: Text("Checkout",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            onPressed: (){},
          ),
        ),
      ),
    );
  }
}
