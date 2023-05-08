import 'package:flutter/material.dart';
import 'package:grain/screens/navbar/home.dart';
import 'screens/farmerspages/ViewFarm.dart';


void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "poppins"),
        home:  HomePage(),
      ),
    );
