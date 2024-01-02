import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/ReviewCartProvider.dart';
class ReviewCartContainer extends StatefulWidget {

  String cartimage;
  String cartname;
  String cartprice;
  String cartquanity;
  String cartid;
  ReviewCartContainer({required this.cartimage,required this.cartname,required this.cartprice,required this.cartquanity,required this.cartid});

  @override
  State<ReviewCartContainer> createState() => _ReviewCartContainerState();
}

class _ReviewCartContainerState extends State<ReviewCartContainer> {
  @override
  Widget build(BuildContext context) {
    final reviewcartprovider = Provider.of<ReviewCartProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
      height: 120,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(child: Image.network(widget.cartimage,height: 120,width: 80,)))),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.cartname,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                  Text(widget.cartprice,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                  Text(widget.cartquanity,style: TextStyle(fontSize: 18),),
                ],
              ),),
            Column(
              children: [
                IconButton(onPressed: (){
                  reviewcartprovider.OpenDialogBox(context,widget.cartname,widget.cartid);
                }, icon: Icon(Icons.delete)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      border: Border.all(width: 2.0,color: Colors.white70)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){

                      }, icon: Icon(Icons.remove)),
                      Text(widget.cartquanity,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.yellow),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
