import 'package:flutter/material.dart';
import 'package:grain/screens/facilitypages/facilities.dart';
import 'package:grain/screens/landing.dart';

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "inter"),
          home: const LandingPage()),
    );
