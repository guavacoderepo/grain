import 'package:flutter/material.dart';

import '../../utilities/colors.dart';
import '../../utilities/font.dart';
import '../../utilities/input.dart';
import '../../utilities/spacer.dart';
import '../../utilities/submitbtn.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
// scafold bg color
        backgroundColor: light,
// appbar section
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
// body section
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
// All body content section
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    h600("Sign In", 20),
                    vertical(10),
                    h400("Log in to your account to continue", 12),
                    vertical(15),
// input section
// name section
                    h400("Email or Phone Number", 14, color: lightGrey),
                    vertical(4),
                    textField("Email or Phone Number"),
                    vertical(24),

// password section
                    h400("Password", 14, color: lightGrey),
                    vertical(4),
                    passwordField("Enter Password", true, () {}),
                    vertical(16),
// forgotten password section
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: h400("Forgot password?", 12, color: appColor),
                      ),
                    ),
                    vertical(48),
// submittion button
                    submitbtn(context, "Sign In", () {}),
                    vertical(24),
// already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        h500("Don't have an account?", 12, color: lightGrey),
                        h400(" Sign Up", 12, color: appColor)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
