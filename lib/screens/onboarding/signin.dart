import 'package:flutter/material.dart';
import 'package:grain/datamodels/userModel.dart';
import 'package:grain/models/auth.dart';
import 'package:grain/models/user.dart';
import 'package:grain/screens/landing.dart';
import 'package:grain/screens/onboarding/createAccount.dart';
import 'package:grain/utilities/routers.dart';
import 'package:grain/utilities/sharepref.dart';
import 'package:provider/provider.dart';
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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
// scafold bg color
        backgroundColor: light,
// appbar section
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: h400("EN", 14, color: dark),
            )
          ],
        ),
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
                    textField("Email or Phone Number", _email),
                    vertical(24),

// password section
                    h400("Password", 14, color: lightGrey),
                    vertical(4),
                    passwordField("Enter Password", true, _pwd, () {}),
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
                    submitbtn(context, "Sign In", () async {
                      Authentication()
                          .loginUser(_email.text, _pwd.text)
                          .then((auth) => onLogin(auth));
                    }),
                    vertical(24),
// already have an account
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          h500("Don't have an account?", 12, color: lightGrey),
                          h400(" Sign Up", 12, color: appColor)
                        ],
                      ),
                      onTap: () => pushandreplace(
                        context,
                        const CreateAccount(),
                      ),
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

  // onregister handler function
  onLogin(auth) {
    if (auth["status"] == false) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(auth["data"].toString()),
      ));

      return;
    }

    // flashBar(context, "success", "User login successful",
    //     Icons.check_circle_outlined);

    // setting user data
    UserModel user = auth["data"];

    // set user
    Provider.of<User>(context, listen: false).setUser(user);
    // save user token in sharepreff
    saveToken(auth["token"]);

    // regiatration successful snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Successful.."),
    ));
    pushandreplace(context, const LandingPage());
  }
}
