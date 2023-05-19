import 'package:flutter/material.dart';
import 'package:grain/screens/splash.dart';
import 'screens/onboarding/createAccount.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "poppins"),
        home: Splash(),
      ),
    );
