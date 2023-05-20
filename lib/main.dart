import 'package:flutter/material.dart';
import 'package:grain/models/user.dart';
import 'package:grain/utilities/colors.dart';
import 'package:provider/provider.dart';
import 'screens/onboarding/splash 2.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) => Center(
          child: CircularProgressIndicator(
        color: appColor,
        strokeWidth: 1,
      ));
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => User())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "poppins"),
      home: const Splash(),
    ),
  ));
}
