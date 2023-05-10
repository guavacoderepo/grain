import 'package:flutter/material.dart';
import 'package:grain/utilities/colors.dart';

import '../../utilities/font.dart';
import '../../utilities/input.dart';
import '../../utilities/spacer.dart';
import '../../utilities/submitbtn.dart';

class ResetPwd extends StatefulWidget {
  const ResetPwd({super.key});

  @override
  State<ResetPwd> createState() => _ResetPwdState();
}

class _ResetPwdState extends State<ResetPwd> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
// scafold bg color
        backgroundColor: light,
// appbar section
        appBar: AppBar(),
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
                    h600("Reset Password", 20),
                    vertical(10),
                    h400("Enter your new password", 12),
                    vertical(15),
// input section
// password section
                    h400("New Password", 14, color: lightGrey),
                    vertical(4),
                    passwordField("Enter  new password", true, () {}),
                    vertical(16),

// confirm password section
                    h400("Confirm Password", 14, color: lightGrey),
                    vertical(4),
                    passwordField("Enter new password again", true, () {}),
                    vertical(24),

// submittion button
                    submitbtn(context, "Reset Password", () {}),
                    vertical(24),
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
