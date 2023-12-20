
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Screens/ProductOverviewScreen.dart';
Widget ReusableContainer(BuildContext context,String productname,String productimageurl){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductOverViewScreen(productname: productname,productimageurl: productimageurl,)));
    },
    child: Container(
      height: 280,
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Expanded(child: Image(image: NetworkImage(productimageurl ??" "),)),
          Expanded(child: Column(
            children: [
              Text(productname??" ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text('50\$ /50 Gram',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(12.0))
                    ),
                    child: const Row(children: [
                      Text('50 Gram'),
                      Icon(Icons.arrow_drop_down)
                    ],),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.all(Radius.circular(8.0))
                    ),
                    child: Row(children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                      Text('1'),
                      IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                    ],),)
                ],
              )
            ],))
        ],
      ),
    ),
  );
}