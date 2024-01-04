import 'package:flutter/material.dart';
class DeliveryTile extends StatefulWidget {
  String username;
  String address;
  String phone;
  String ID;
  String deladdresstype;
   DeliveryTile({required this.username,required this.address,required this.phone,required this.ID,required this.deladdresstype});

  @override
  State<DeliveryTile> createState() => _DeliveryTileState();
}

class _DeliveryTileState extends State<DeliveryTile> {
  OpenDialogBox(BuildContext context){
    return showDialog(context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Delete"),
            content: Text("Are You Sure You Want To Delete This Address"),
            actions: [
              ElevatedButton(onPressed: ()=>Navigator.of(context).pop(true), child: Text("No")),
              ElevatedButton(onPressed: (){

                Navigator.of(context).pop(true);
              }, child: Text("Yes")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: (){
        OpenDialogBox(context);
      },
      child: Container(
        height: 120,
        color: Colors.grey,
        margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
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
                    Text(widget.username,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                    SizedBox(width: 50,),
                    Chip(label: Text(widget.deladdresstype),backgroundColor: Colors.yellow,)
                  ],),
                Text(widget.address,style: TextStyle(fontSize: 14)),
                Text(widget.phone,style: TextStyle(fontSize: 14),)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
