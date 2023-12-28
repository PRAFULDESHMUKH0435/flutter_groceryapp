import 'package:flutter/material.dart';
class ExpansionTileSingleItem extends StatelessWidget {
  const ExpansionTileSingleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Item Name"),
      subtitle: Text("Item Description and all "),
      leading: Image.network('https://media.istockphoto.com/id/184276818/photo/red-apple.jpg?s=612x612&w=0&k=20&c=NvO-bLsG0DJ_7Ii8SSVoKLurzjmV0Qi4eGfn6nW3l5w='),
    );
  }
}
