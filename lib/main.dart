import 'package:flutter/material.dart';
import 'package:grain/screens/splash.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "inter"),
        home: const Splash(),
      ),
    );
