import 'package:flutter/material.dart';
import 'package:flutter_groceryapp/Models/AddressModel.dart';
import 'package:flutter_groceryapp/Services/FirebaseServices.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({super.key});

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {

  FirebaseServices services = FirebaseServices();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _firstnamecontroller = TextEditingController();
  final _lastnamecontroller = TextEditingController();
  final _mobilenocontroller = TextEditingController();
  final _altmobnocontroller = TextEditingController();
  final _societycontroller = TextEditingController();
  final _streetcontroller = TextEditingController();
  final _landmarkcontroller = TextEditingController();
  final _citycontroller = TextEditingController();
  final _areacontroller = TextEditingController();
  final _pincodecontroller = TextEditingController();

  String? Namevalidator(value) {
    if (value!.isEmpty) {
      return "This Field Is Required";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Delivery Address"),
        backgroundColor: Colors.yellow,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: TextFormField(
                validator: Namevalidator,
                controller: _firstnamecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: "Enter First Name",
                  label: Text("First Name"),
                  prefixIcon: Icon(Icons.person_outline),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: TextFormField(
                validator: Namevalidator,
                controller: _lastnamecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: "Enter Last Name",
                  label: Text("Last Name"),
                  prefixIcon: Icon(Icons.person_outline),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: TextFormField(
                validator: Namevalidator,
                controller: _mobilenocontroller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: " Mobile Number ",
                  label: Text("Mobile Number"),
                  prefixIcon: Icon(Icons.phone_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: TextFormField(
                validator: Namevalidator,
                controller: _altmobnocontroller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: "Alternate Mobile Number",
                  label: Text("Alternate Mobile Number"),
                  prefixIcon: Icon(Icons.phone_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: TextFormField(
                controller: _societycontroller,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: " Society",
                  label: Text("Society "),
                  prefixIcon: Icon(Icons.home_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: TextFormField(
                validator: Namevalidator,
                controller: _streetcontroller,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: "Street",
                  label: Text("Street"),
                  prefixIcon: Icon(Icons.home_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: TextFormField(
                validator: Namevalidator,
                controller: _landmarkcontroller,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: "LandMark",
                  label: Text("LandMark"),
                  prefixIcon: Icon(Icons.home_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: TextFormField(
                validator: Namevalidator,
                controller: _citycontroller,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: " City",
                  label: Text("City"),
                  prefixIcon: Icon(Icons.location_city),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: TextFormField(
                validator: Namevalidator,
                controller: _areacontroller,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: "Area",
                  label: Text("Area"),
                  prefixIcon: Icon(Icons.area_chart),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: TextFormField(
                validator: Namevalidator,
                controller: _pincodecontroller,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: "PinCode",
                  label: Text("PinCode"),
                  prefixIcon: Icon(Icons.reduce_capacity),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14.0))),
                ),
              ),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                child: Row(
                  children: [
                    SizedBox(width: 140,),
                  Text("Select",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  SizedBox(width: 20,),
                  Icon(Icons.location_on)
                ],),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(14.0))
                ),
              ),
            ),
          ],
        ),
      ),


      bottomNavigationBar: InkWell(
        onTap: (){
          if(_formkey.currentState!.validate()){
            services.checkcount();
            print(FirebaseServices.count);
            if(FirebaseServices.count<3){
              String ID = DateTime.now().millisecondsSinceEpoch.toString();
              services.AddUserAddressToDB(AddressModel(
                ID: ID,
                FirstName:  _firstnamecontroller.text.toString(),
                LastName: _lastnamecontroller.text.toString(),
                MobileNumber: _mobilenocontroller.text.toString(),
                AlterNateMobileNumber: _altmobnocontroller.text.toString(),
                Society: _societycontroller.text.toString(),
                Street: _streetcontroller.text.toString(),
                Landmark: _landmarkcontroller.text.toString(),
                City: _citycontroller.text.toString(),
                Area: _areacontroller.text.toString(),
                PinCode: _pincodecontroller.text.toString(),
              ),context);
              _firstnamecontroller.clear();
              _lastnamecontroller.clear();
              _mobilenocontroller.clear();
              _altmobnocontroller.clear();
              _societycontroller.clear();
              _streetcontroller.clear();
              _landmarkcontroller.clear();
              _citycontroller.clear();
              _areacontroller.clear();
              _pincodecontroller.clear();
            }else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("At Max 3 Address Can Be Saved Only")));
            }

          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All Fields Are Mandatory")));
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 14.0,vertical: 8.0),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.all(Radius.circular(14.0))
          ),
          child: Center(child: Text("Add Address",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
        ),
      ),
    );
  }
}
