import 'package:flutter/material.dart';


push(context, Widget route) =>
    Navigator.push(context, MaterialPageRoute(builder: ((context) => route)));

pushandreplace(context, route) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: ((context) => route)));
