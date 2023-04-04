import 'package:flutter/material.dart';
import 'package:grain/screens/landing.dart';

import 'screens/farmerspages/farmersCorner.dart';

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: "inter"),
          home: const FarmersCorner()),
    );
