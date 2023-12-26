import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Models/CartModel.dart';
import 'package:provider/provider.dart';

import '../Providers/ReviewCartProvider.dart';
class CounterWidget extends StatefulWidget {
   String cartname;
   String cartimage;
   int cartprice ;
   String cartid;
   CounterWidget({required this.cartname,required this.cartimage,required this.cartprice,required this.cartid});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
   bool isinitial = true;
   int _count =1;

  @override
  Widget build(BuildContext context) {
    final reviewcartprovider = Provider.of<ReviewCartProvider>(context);
    print("ONLY COUNTER WALI  METHOD CALLED");
    return isinitial
        ? Expanded(
          child: ElevatedButton(
            child: Text("+ ADD"),
              onPressed: () {
                 setState(() {
                   isinitial=false;
                 });
                 reviewcartprovider.AddItemToReviewCart(
                   widget.cartname,
                   widget.cartid,
                   widget.cartimage,
                   widget.cartprice,
                   _count,
                 );
                 print("QUANTITY IS $_count");
              },
           ),
        )
        : Expanded(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius:BorderRadius.all(Radius.circular(8.0))),
                child: Row(
                   children: [
                     IconButton(
                        onPressed: () {
                          if(_count==1){
                            setState(() {isinitial=true;});
                            reviewcartprovider.DeletItemFromCart(widget.cartid);
                          }
                          if(_count>1){
                           setState(() {
                             _count-=1;
                           });
                           reviewcartprovider.AddItemToReviewCart(
                             widget.cartname,
                             widget.cartid,
                             widget.cartimage,
                             widget.cartprice,
                             _count,
                           );
                          }
                        },
                        icon: Icon(Icons.remove)),
                     Text(_count.toString()),
                     IconButton(
                      onPressed: () {
                        setState(() {
                          _count+=1;
                        });
                        reviewcartprovider.AddItemToReviewCart(
                            widget.cartname,
                            widget.cartid,
                            widget.cartimage,
                            widget.cartprice,
                            _count,
                        );
                        print("QUANTITY IS $_count");
                      },
                      icon: Icon(Icons.add)),
                ],
              ),
              ),
        );
  }
}
