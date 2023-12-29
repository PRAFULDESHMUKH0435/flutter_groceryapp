import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/AddDeliveryAddress.dart';
class DeliveryDetailsScreen extends StatelessWidget {
  const DeliveryDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Container(
              height: 120,
              color: Colors.grey,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio(value: "praful", groupValue: "praful", onChanged: (newvalue){}),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                        Text("Praful Deshmukh",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                        SizedBox(width: 50,),
                        Chip(label: Text("Home"),backgroundColor: Colors.yellow,)
                      ],),
                      Text("78 Ambika Nagar Narsala Road Nagpur,440034",style: TextStyle(fontSize: 14)),
                      Text("+919359407730",style: TextStyle(fontSize: 14),)
                    ],
                  ),

                ],
              ),
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
