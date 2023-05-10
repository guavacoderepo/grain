import 'package:flutter/material.dart';
import 'screens/onboarding/createAccount.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "poppins"),
        home: CreateAccount(),
      ),
    );
