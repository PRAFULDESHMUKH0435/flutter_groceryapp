import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/PaymentSummarySingleRow.dart';
import 'package:flutter_groceryapp/Constants/singleitemexpansiontile.dart';
class PaymentSummary extends StatefulWidget {

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  bool defaultval = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      appBar: AppBar(
        title: Text("Payment Summary"),
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Praful Deshmukh",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black),),
            subtitle: Text("78,Ambika Nagar Narsala Road Nagpur ,440034",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
          ),
          Divider(height: 1,),
          ExpansionTile(title: Text("order Items 6",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),children: [
            ExpansionTileSingleItem(),
            ExpansionTileSingleItem(),
            ExpansionTileSingleItem(),
            ExpansionTileSingleItem(),
            ExpansionTileSingleItem(),
            ExpansionTileSingleItem(),
            ExpansionTileSingleItem(),
          ],),
          Divider(height: 1,color: Colors.black,),
          PaymentSummarySingleContainer(title1: "Sub Total",title2: "\$200"),
          PaymentSummarySingleContainer(title1: "Shipping Charge",title2: "\$0"),
          PaymentSummarySingleContainer(title1: "Compen Discount",title2: "\$10"),
          Divider(height: 1,color: Colors.black,),
          Container(
              margin: EdgeInsets.only(left: 12.0,top: 5.0),
              child: Text("Payment Options",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)),
          RadioListTile(
              value: defaultval,
              groupValue: "Gropus",
              title: Text("Home",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
              secondary: Icon(Icons.home_outlined,size: 30),
              onChanged: (newvalue){
                setState(() {
                  defaultval=!defaultval;
                });
              }),

        ],
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        subtitle: Text("\$300",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),),
        trailing: InkWell(
          onTap: (){},
          child: Container(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(30.0))
            ),
            child: Center(child: Text("Place Order",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)),
          ),
        ),
      ),
    );
  }
}
