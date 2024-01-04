import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/AddDeliveryAddress.dart';
import 'package:flutter_groceryapp/Services/FirebaseServices.dart';

import '../Constants/DeliveryTile.dart';
class DeliveryDetailsScreen extends StatelessWidget {
   DeliveryDetailsScreen({super.key});
   FirebaseServices services = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    print("LENGTH IS");
    print(services.checkcount());
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
            FirebaseServices.count==0?
            Container(
              height: 200,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(Radius.circular(14.0))
              ),
              child: Center(child: Text("Address Is Not Selected",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),)
                : Expanded(
              child: StreamBuilder(
                stream:   FirebaseFirestore.instance.collection("Address").snapshots(),
                builder: (context,snapshot){
                  return ListView.builder(
                      itemCount: snapshot.data!.size,
                      itemBuilder: (context,index){
                        String fullname = snapshot.data!.docs[index]['FirstName']+snapshot.data!.docs[index]['LastName'];
                        String address = snapshot.data!.docs[index]['Society'] +snapshot.data!.docs[index]['Street'] +snapshot.data!.docs[index]['Area'] +snapshot.data!.docs[index]['City'];
                        String deliveryaddtype = snapshot.data!.docs[index]['DeliveryAddressType'];
                        return DeliveryTile(
                            ID: snapshot.data!.docs[index]['ID'],
                            username: fullname,
                            address: address,
                            deladdresstype: deliveryaddtype,
                            phone: snapshot.data!.docs[index]['MobileNumber']);
                      }
                  );
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

        },
        child: Container(
          height: 50,
          margin: EdgeInsets.symmetric(horizontal: 22.0,vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(34.0)),
            color: Colors.yellow
          ),
          child: Center(child: Text("Proceed To Pay",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
        ),
      ),
    );
  }
}
