import 'package:flutter/material.dart';
class EXAMPLE3 extends StatelessWidget {
  const EXAMPLE3({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("WhatsApp"),
            bottom: TabBar(
              tabs: [
                Tab(child: Icon(Icons.camera),),
                Tab(child: Text("Chats")),
                Tab(child: Text("Status")),
                Tab(child: Text("Call")),
              ],
            ),
          ),

          body: TabBarView(
              children: [
                Tab(child: Text("Screen 1"),),
                Tab(child: Text("Screen 2"),),
                Tab(child: Text("Screen 3"),),
                Tab(child: Text("Screen 4"),),
          ]),

          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
            onPressed: (){},
          ),
        ));
  }
}
