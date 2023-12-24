import 'package:flutter/material.dart';
class QuantityDropDown extends StatelessWidget {
  const QuantityDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:const BoxDecoration(
          borderRadius:BorderRadius.all(Radius.circular(12.0))),
        child: Row(
            children: [
                Text('50 Gram'),
                Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
}
