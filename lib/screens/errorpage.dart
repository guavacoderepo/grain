import 'package:flutter/material.dart';
import '../utilities/font.dart';
import 'onboarding/splash 2.dart';

class ErrorPage extends StatelessWidget {
  final String? error;
  const ErrorPage(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          h500(error, 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Splash(),
                ),
              );
            },
            child: h400("Reload", 14),
          )
        ],
      )),
    );
  }
}
