import 'package:flutter/material.dart';
Widget ReusableContainer(){
  return Expanded(
    child: Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
      child:  Column(
        children: [
          Container(
              height: 80,
              width: 80,
              child: Image(image: NetworkImage('https://pngfre.com/wp-content/uploads/apple-43-1024x1015.png'),width: 80,height: 80,)
          ),
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text("Fresh Basil"),
               Text("50\$/50Gram"),
               Row(
                 children: [
                   ListTile(
                     title: Text("50 Gram"),
                     trailing: Icon(Icons.arrow_drop_down),
                   )
                 ],
               )
             ],
           )
        ],
      ),
    ),
  );
}