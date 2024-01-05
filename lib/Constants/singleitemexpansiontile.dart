import 'package:flutter/material.dart';
class ExpansionTileSingleItem extends StatelessWidget {
  String itemname;
  String itemprice;
  String itemproimage;
  int itemquantity;
   ExpansionTileSingleItem({required this.itemname,required this.itemprice,required this.itemproimage,required this.itemquantity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(itemname,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      subtitle: Text("Qty : ${itemquantity.toString()}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
      trailing: Text("Price: ${itemprice}",style: TextStyle(fontSize: 20),),
      leading: Image.network(itemproimage),
    );
  }
}
