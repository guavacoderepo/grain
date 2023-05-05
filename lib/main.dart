import 'package:flutter/material.dart';
import 'package:grain/screens/farmerspages/farmersCorner.dart';
import 'package:grain/screens/navbar/home.dart';


void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "poppins"),
        home: const FarmersCorner(),
      ),
    );
