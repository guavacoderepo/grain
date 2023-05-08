import 'package:flutter/material.dart';
import 'screens/farmerspages/farmerUpload.dart';


void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "poppins"),
        home:  FarmerUpload(),
      ),
    );
