
import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Providers/HerbsProductProvider.dart';
import 'package:flutter_groceryapp/Screens/ProductOverviewScreen.dart';
import 'package:provider/provider.dart';

class ReUsableContainer extends StatelessWidget {
   String productname;
   String productimageurl;
   int productprice;
   ReUsableContainer({required this.productname,required this.productimageurl,required this.productprice});

   int temp=1;
   ValueNotifier<int> _count = ValueNotifier(1);
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<HerbsProductProvider>(context);
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductOverViewScreen(productname: productname,productimageurl: productimageurl,productprice: productprice,)));
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
                Text('${productprice}\$ /50 Gram',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(12.0))
                      ),
                      child:  Row(children: [
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
                        IconButton(onPressed: (){
                          while(_count.value>1){
                            _count.value-=1;
                            temp=_count.value;
                          }
                        }, icon: Icon(Icons.remove)),
                        ValueListenableBuilder(
                          valueListenable: _count,
                          builder: (context,child,value){
                            return Text(_count.value.toString());
                          },
                        ),
                        IconButton(onPressed: (){
                          _count.value+=1;
                          temp=_count.value;
                        }, icon: Icon(Icons.add)),
                      ],),)
                  ],
                )
              ],))
          ],
        ),
      ),
    );();
  }
}
