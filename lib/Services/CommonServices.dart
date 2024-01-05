import 'dart:async';

import 'package:flutter/material.dart';

class CommonServices {
     bool isaddressselected = false;
     GetCurrentUserLocation(){
        Timer(Duration(seconds: 5), () {
           Center(child: CircularProgressIndicator());
        });
     }
}