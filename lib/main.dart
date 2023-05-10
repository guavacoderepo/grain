import 'package:flutter/material.dart';
import 'package:grain/screens/landing.dart';


void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "poppins"),
        home: LandingPage(),
      ),
    );
