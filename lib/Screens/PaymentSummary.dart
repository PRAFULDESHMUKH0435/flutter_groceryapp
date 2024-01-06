import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Constants/PaymentSummarySingleRow.dart';
import 'package:flutter_groceryapp/Constants/singleitemexpansiontile.dart';
import 'package:flutter_groceryapp/Providers/ReviewCartProvider.dart';
import 'package:provider/provider.dart';

class PaymentSummary extends StatefulWidget {
  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  String paymentmode = "Cash On Delivery";




  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReviewCartProvider>(context);
    provider.SubTotal();
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
          ExpansionTile(title: Text("order Items (${provider.cartlist.length})",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            children: provider.cartlist.map((e){
              return ExpansionTileSingleItem(
                itemname: e.cartname,
                itemprice: e.cartprice.toString(),
                itemquantity: e.cartquantity,
                itemproimage: e.cartimage,
              );
            }).toList(),),
          Divider(height: 1,color: Colors.black,),
          PaymentSummarySingleContainer(title1: "Sub Total",title2: "${provider.totalprice}"),
          PaymentSummarySingleContainer(title1: "Shipping Charge",title2: "(+) ${provider.shippingcharge}"),
          PaymentSummarySingleContainer(title1: "Compen Discount",title2: "(-) ${provider.compendiscount}"),
          Divider(height: 1,color: Colors.black,),
          Container(
              margin: EdgeInsets.only(left: 12.0,top: 8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Options",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                  RadioListTile(
                      title: Text("Cash On Delivery",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      value: "Cash On Delivery",
                      groupValue: paymentmode,
                      onChanged: (newvalue){
                        setState(() {
                          paymentmode=newvalue!;
                          print(paymentmode);
                          if(provider.onlinediscount==5.0){
                            provider.onlinediscount=0.0;
                          }
                        });
                      }),
                  RadioListTile(
                      title: Text("Online Payment",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                      value: "Online",
                      groupValue: paymentmode,
                      onChanged: (newvalue){
                        setState(() {
                          paymentmode=newvalue!;
                          print(paymentmode);
                          provider.payableamount(true);
                        });
                      }),
                ],
              )),

        ],
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        subtitle: Text("${paymentmode=="Online"?provider.payableamount(true):provider.payableamount(false)}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),),
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
