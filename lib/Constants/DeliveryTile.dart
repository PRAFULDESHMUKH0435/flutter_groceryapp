import 'package:flutter/material.dart';
class DeliveryTile extends StatefulWidget {
  String username;
  String address;
  String phone;
  String ID;
  String isselectedornot;
  String deladdresstype;
   DeliveryTile({required this.username,required this.address,required this.phone,required this.ID,required this.deladdresstype,required this.isselectedornot});

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
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: RadioListTile(
        title: Text(widget.username,style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        subtitle: Text(widget.address,style:  TextStyle(fontSize: 18)),
        groupValue: widget.isselectedornot,
        secondary: Text(widget.deladdresstype,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
        value: widget.deladdresstype,
        onChanged: (newvalue){
          setState(() {
            widget.isselectedornot=newvalue!;
          });
        },
      ),
    );
  }
}
