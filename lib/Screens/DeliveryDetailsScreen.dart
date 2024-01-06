import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Providers/AddressProvider.dart';
import 'package:flutter_groceryapp/Screens/AddDeliveryAddress.dart';
import 'package:flutter_groceryapp/Screens/PaymentSummary.dart';
import 'package:flutter_groceryapp/Services/CommonServices.dart';
import 'package:flutter_groceryapp/Services/FirebaseServices.dart';
import 'package:provider/provider.dart';

class DeliveryDetailsScreen extends StatefulWidget {
   DeliveryDetailsScreen({super.key});

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
   FirebaseServices services = FirebaseServices();
   CommonServices commonServices = CommonServices();


   @override
  void initState() {
    // TODO: implement initState
     final addressprovider = Provider.of<AddressProvider>(context,listen: false);
     addressprovider.GetAddress();
     addressprovider.GetAddressCount();
     super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addressprovider = Provider.of<AddressProvider>(context);
    addressprovider.GetAddress();
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Page"),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
              leading: Image.network('https://w7.pngwing.com/pngs/137/787/png-transparent-location-icon-computer-icons-map-location-map-geolocation-symbol-svg.png'),
              title: Text("Deliver To",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            ),
            Divider(height: 10),
            addressprovider.count==1 ?
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(14.0))
              ),
              child: ListTile(
                title: Text(addressprovider.username,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(addressprovider.useraddress,style: TextStyle(fontSize: 16)),
                    Text(addressprovider.mobilenumber,style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w400))
                  ],
                ),
                trailing: IconButton(onPressed: (){
                  commonServices.EditDialog(context,addressprovider.username,addressprovider.useraddress,addressprovider.mobilenumber);
                },icon: Icon(Icons.edit)),
              ),
            ) :
             Container(
               margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
               height: 150,
               width: double.infinity,
               decoration: BoxDecoration(
                   color: Colors.grey,
                   borderRadius: BorderRadius.all(Radius.circular(14.0))
               ),
               child: Center(child: Text("Please Add Address First")),
             )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDeliveryAddress()));
        },
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentSummary(fullname: addressprovider.username,address: addressprovider.useraddress)));
        },
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 22.0,vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(34.0)),
            color: Colors.yellow
          ),
          child: Center(child: Text("Payment Summary",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
        ),
      ),
    );
  }
}
