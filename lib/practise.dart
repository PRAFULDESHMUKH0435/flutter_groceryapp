import 'package:flutter/material.dart';
class Practise extends StatefulWidget {
  const Practise({super.key});

  @override
  State<Practise> createState() => _PractiseState();
}

class _PractiseState extends State<Practise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            color: Colors.grey,
            alignment: Alignment.bottomCenter,
            child:Row(
              children: [
                Expanded(child: Icon(Icons.home),flex: 2),
                Expanded(child: Icon(Icons.home)),
                
              ],
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.9,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.0),bottomRight: Radius.circular(24.0))
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.3,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0)
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu_outlined,color: Colors.white70,),
                    Icon(Icons.more_vert,color: Colors.white70,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Welcome Back",style: TextStyle(fontSize: 25,color: Colors.white70),))
                  ],
                )
              ],
            ),
          ),
          Positioned(
              top: 180,
              left: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network('https://www.pngitem.com/pimgs/m/404-4042710_circle-profile-picture-png-transparent-png.png',scale: 3,width: 150.0,height: 150.0,),
              )),
        ],
      ),
    );
  }
}
