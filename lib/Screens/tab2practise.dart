import 'package:flutter/material.dart';
class TAB2PRACTISE extends StatelessWidget {
  const TAB2PRACTISE({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("WhatApp"),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white70,
              tabs: [
               Tab(child:  Icon(Icons.camera),),
               Tab(child: Text("Chats",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))),
               Tab(child:  Text("Status",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))),
               Tab(child:  Text("Contacts",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("Camera")),
              ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text("Chat ${index+1}"),
                      subtitle: Text("Message From ${index+1}"),
                      leading: Icon(Icons.home),
                    );
                  }),
              Center(child: Text("Screen 3")),
              Center(child: Text("Screen 4")),

            ],
          ),
        ));
  }
}
