import 'package:flutter/material.dart';
class TabbarView1 extends StatelessWidget {
  const TabbarView1({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("Tabbar Practise"),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.menu))
            ],
            // centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white70,
              tabs: [
                Tab(child: Icon(Icons.camera),),
                Text("Chats"),
                Text("Status"),
                Text("Call"),
              ],
            ),
          ),

          body: TabBarView(
              children: [
                Center(child: Text("Screen 1")),
                Center(child: Text("Screen 2")),
                Center(child: Text("Screen 3")),
                Center(child: Text("Screen 4")),
              ]
          ),

          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
            onPressed: (){},
          ),
        ));



  }
}
