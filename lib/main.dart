import 'package:flutter/material.dart';
import 'screens/dashboard.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "inter"),
        home: const Dashboard(),
      ),
    );
