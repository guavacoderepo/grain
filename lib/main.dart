import 'package:flutter/material.dart';
import 'package:grain/models/user.dart';
import 'package:provider/provider.dart';
import 'screens/onboarding/splash 2.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => User())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "poppins"),
        home: Splash(),
      ),
    ));
