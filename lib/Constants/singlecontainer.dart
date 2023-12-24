import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/ReviewCartProvider.dart';

class SingleContainer extends StatelessWidget {
   bool issearchscreen;
   String prodname;
   String proprice;
   String proimage;
   SingleContainer({required this.issearchscreen, required this.prodname,required this.proprice,required this.proimage});

  @override
  Widget build(BuildContext context) {
    final reviewcartprovider = Provider.of<ReviewCartProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
      height: 120,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(child: Image.network(proimage,height: 120,width: 80,)))),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(prodname,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
                  Text("\$$proprice",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                  issearchscreen? Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey,width: 2.0,),
                        borderRadius: BorderRadius.all(Radius.circular(12.0))
                    ),
                    child:const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('52 Gram',style: TextStyle(fontSize: 18),),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ): Text('52 Gram',style: TextStyle(fontSize: 18),),
                ],
              ),),
            issearchscreen? Expanded(
                flex: 1,
                child: ElevatedButton(
                  child: Text("+ ADD"),
                  onPressed: (){},
                )):Column(
              children: [
                IconButton(onPressed: (){
                  reviewcartprovider.OpenDialogBox(context,prodname);
                }, icon: Icon(Icons.delete)),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      border: Border.all(width: 2.0,color: Colors.white70)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                      Text("1",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.yellow),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
