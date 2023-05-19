// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:grain/screens/landing.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     Timer.periodic(
//       const Duration(seconds: 3),
//       (timer) => Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const LandingPage()),
//       ),
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Image.asset(
//         "assets/images/Splash.png",
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }
