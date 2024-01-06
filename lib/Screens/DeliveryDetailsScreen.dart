import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Providers/AddressProvider.dart';
import 'package:flutter_groceryapp/Screens/AddDeliveryAddress.dart';
import 'package:flutter_groceryapp/Screens/PaymentSummary.dart';
import 'package:flutter_groceryapp/Services/FirebaseServices.dart';
import 'package:provider/provider.dart';

import '../Constants/DeliveryTile.dart';
class DeliveryDetailsScreen extends StatefulWidget {
   DeliveryDetailsScreen({super.key});

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
   FirebaseServices services = FirebaseServices();

   late String fullname;
   late String address;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final addressprovider = Provider.of<AddressProvider>(context,listen: false);
    print("Check Count Method Called");
    addressprovider.checkcount();
    print(" 111   Check Count Method Returned Count As ${addressprovider.count}");
    print("INITSTATE ADDRESS COUNT LENGTH IS ${addressprovider.count}");
  }


  @override
  Widget build(BuildContext context) {
    final addressprovider = Provider.of<AddressProvider>(context);
    print("UPDATED ADDRESS COUNT LENGTH IS ${addressprovider.count}");
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
            addressprovider.count==0?
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
              ),
              child: Center(child: Text("Please Select Delivery Address")),
            )
                : Expanded(
              child: StreamBuilder(
                stream:   FirebaseFirestore.instance.collection("Address").snapshots(),
                builder: (context,snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }else{
                    return ListView.builder(
                        itemCount: snapshot.data!.size,
                        itemBuilder: (context,index){
                           fullname = snapshot.data!.docs[index]['FirstName']+" "+snapshot.data!.docs[index]['LastName'];
                           address = snapshot.data!.docs[index]['Society'] +snapshot.data!.docs[index]['Street'] +snapshot.data!.docs[index]['Area'] +snapshot.data!.docs[index]['City'];
                          String deliveryaddtype = snapshot.data!.docs[index]['DeliveryAddressType'];
                          return DeliveryTile(
                              isselectedornot: snapshot.data!.docs[index]['isselected'],
                              ID: snapshot.data!.docs[index]['ID'],
                              username: fullname,
                              address: address,
                              deladdresstype: deliveryaddtype,
                              phone: snapshot.data!.docs[index]['MobileNumber']);
                        }
                    );
                  }
                },
              ),
            ),
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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentSummary(fullname: fullname,address: address)));
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
