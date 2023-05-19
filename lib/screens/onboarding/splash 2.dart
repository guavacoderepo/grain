import 'package:grain/models/user.dart';
import 'package:grain/screens/onboarding/signin.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/screens/errorpage.dart';
import 'package:flutter/material.dart';
import '../../utilities/font.dart';
import '../../utilities/sharepref.dart';
import '../landing.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // Navigation widget
  navigate(Widget screen) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );

  // route to login page
  toLogin() => navigate(const Signin());

// route dashbord
  toDashboard(id) => users(context).then((value) {
        if (value["status"] == false) {
          return toLogin();
        }
        navigate(const LandingPage());
      }).onError((error, stackTrace) {
        // print(stackTrace);
        navigate(ErrorPage(error.toString().split(":")[1]));
      });

// init method
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0), () async {
      String id = await retriveToken();
      if (id == "null") {
        toLogin();
      } else {
        toDashboard(id);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: h700("Grain", 28, color: light),
      ),
    );
  }
}
