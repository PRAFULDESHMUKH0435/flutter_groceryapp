import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/QuantityDropDown.dart';
import 'package:flutter_groceryapp/Screens/ProductOverviewScreen.dart';

import 'CounterWidget.dart';

class ReUsableContainer extends StatelessWidget {
  String productname;
  String productimageurl;
  int productprice;
  String proid;
  ReUsableContainer({required this.productname,required this.productimageurl,required this.productprice,required this.proid});

  int temp = 1;
  bool ishome = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductOverViewScreen(
                      productname: productname,
                      productimageurl: productimageurl,
                      productprice: productprice,
                      productid: proid,
                    )));
           },
      child: Container(
        height: 250,
        width: 200,
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              child: Image(image: NetworkImage(productimageurl ?? ""),
            )),
            Container(
                height: 150,
                child: Column(
                  children: [
                      Text(
                        productname ?? " ",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${productprice}\$ /50 Gram',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          QuantityDropDown(),
                          CounterWidget(
                            cartname: productname,
                            cartimage: productimageurl,
                            cartprice: productprice,
                            cartid: proid,
                          ),
                        ],
                      )
                  ],
            ))
          ],
        ),
      ),
    );
  }
}
