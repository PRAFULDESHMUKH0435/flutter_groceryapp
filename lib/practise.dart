import 'package:flutter/material.dart';
class Practise extends StatefulWidget {
  const Practise({super.key});

  @override
  State<Practise> createState() => _PractiseState();
}

enum AccountType {Free,Paid,Premium}
class _PractiseState extends State<Practise> {
  bool isselected = false;
  bool isselected2 = false;
  bool isselected3 = false;

  String Person = "Praful";

  @override
  Widget build(BuildContext context) {
    print(AccountType.Premium.index);
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CheckboxListTile(
          //   title: Text("Nagpur"),
          //     value: isselected,
          //     onChanged: (newval){
          //       setState(() {
          //         isselected=newval!;
          //       });
          //     }),
          // CheckboxListTile (
          //             title: Text("Pune"),
          //               value: isselected2,
          //               onChanged: (newval){
          //                 setState(() {
          //                   isselected2=newval!;
          //                 });
          //               }),
          //
          // RadioListTile(
          //     title: Text("Begineer"),
          //     value: "Begineer",
          //     groupValue: level,
          //     onChanged: (newvalue){
          //       setState(() {
          //         level=newvalue!;
          //       });
          //     }),
          // RadioListTile(
          //     title: Text("Intermediate"),
          //     value: "Intermediate",
          //     groupValue: level,
          //     onChanged: (newvalue){
          //       setState(() {
          //         level=newvalue!;
          //       });
          //     })


          // CheckboxListTile(
          //     title: Text("Delhi"),
          //     value: isselected,
          //     onChanged: (newvalue){
          //       setState(() {
          //         isselected=newvalue!;
          //       });
          //     }),
          // CheckboxListTile(
          //     title: Text("Haridwar"),
          //     value: isselected2,
          //     onChanged: (newvalue){
          //       setState(() {
          //         isselected2=newvalue!;
          //       });
          //     }),
          // CheckboxListTile(
          //     title: Text("Noida"),
          //     value: isselected3,
          //     onChanged: (newvalue){
          //       setState(() {
          //         isselected3=newvalue!;
          //       });
          //     }),
          // RadioListTile(
          //     title: Text("Praful"),
          //     value: "Praful",
          //     groupValue: Person,
          //     onChanged: (newvalue){
          //       setState(() {
          //         Person=newvalue!;
          //       });
          //     }),
          // RadioListTile(
          //     title: Text("Kailash"),
          //     value: "Kailash",
          //     groupValue: Person,
          //     onChanged: (newvalue){
          //       setState(() {
          //         Person=newvalue!;
          //       });
          //     }),
          // RadioListTile(
          //     title: Text("Harshal"),
          //     value: "Harshal",
          //     groupValue: Person,
          //     onChanged: (newvalue){
          //       setState(() {
          //         Person=newvalue!;
          //       });
          //     })

          ListTile(
            title: Text("Choose Date"),
            trailing: Icon(Icons.calendar_month),
            onTap: (){
              showDatePicker(context: context,
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                  initialDate: DateTime.now(),
              ).then((value){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Selected Date Is ${value}")));
              });
            },
          ),
          ListTile(
            title: Text("Choose Time"),
            trailing: Icon(Icons.watch_later_outlined),
            onTap: (){
              showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now()).then((value){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
              });
            },
          )

        ],
      ),
    );
  }
}
