import 'package:flutter/material.dart';
import 'package:grain/screens/farmerUpload.dart';
import 'package:grain/screens/farmersCorner.dart';

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "inter"),
          home: const FarmerUpload()),
    );
