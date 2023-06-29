import 'package:flutter/material.dart';
import 'package:grain/screens/onboarding/signin.dart';
import 'package:provider/provider.dart';
import '../../datamodels/userModel.dart';
import '../../models/auth.dart';
import '../../models/user.dart';
import '../../utilities/colors.dart';
import '../../utilities/font.dart';
import '../../utilities/input.dart';
import '../../utilities/routers.dart';
import '../../utilities/sharepref.dart';
import '../../utilities/spacer.dart';
import '../../utilities/submitbtn.dart';
import '../landing.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _dob = TextEditingController();

  // final bool _farmer = true;
  // final bool _facilties = false;

  String? _category = 'farmer';
  String? language = "English";
  bool isLoading = false;
  bool pwd = false;
  // List of items in our dropdown menu
  var items = ['farmer', 'facility owner'];

  var lang = ["English", "Igbo", "Youroba", "Hausa"];

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
              child: DropdownButton(
                value: language,
                items: lang
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: h400(item, 14, color: dark),
                        ))
                    .toList(),
                onChanged: (val) => setState(() => language = val),
              ),
            )
          ],
        ),

        // h400("EN", 14, color: dark),
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
                    h600("Create Account", 20),
                    vertical(10),
                    h400("Sign up to get started", 12),
                    vertical(15),
// input section
// name section
                    h300("Name", 14, color: lightGrey),
                    vertical(4),
                    textField("Enter Name", _name),
                    vertical(15),

// email section
                    h300("Email", 14, color: lightGrey),
                    vertical(4),
                    textField("Enter email address", _email),
                    vertical(15),

// dob section
                    h300("Date of Birth", 14, color: lightGrey),
                    vertical(4),
                    textField("Enter date of birth", _dob),
                    vertical(15),

// phone number section
                    h300("Phone Number", 14, color: lightGrey),
                    vertical(4),
                    textField("Enter phone number", _phone),
                    vertical(15),
// password section
                    h300("Password", 14, color: lightGrey),
                    vertical(4),
                    passwordField("Enter Password", pwd, _pwd,
                        () => setState(() => pwd = !pwd)),

                    vertical(15),

                    DropdownButton(
                      // Initial Value
                      value: _category,

                      // Down Arrow Icon

                      // Array list of items
                      items: items.map((String item) {
                        return DropdownMenuItem(
                          value: item,
                          child: h400(item, 14, color: dark),
                        );
                      }).toList(),

                      onChanged: (String? newValue) {
                        setState(() {
                          _category = newValue!;
                        });
                      },
                    ),
                    vertical(40),

// submittion button
                    submitbtn(context, "Create Account", isLoading, () async {
                      setState(() => isLoading = true);
                      Authentication()
                          .registerUser(_name.text, _email.text, _phone.text,
                              _pwd.text, _category)
                          .then((auth) => onRegister(auth));
                    }),
                    vertical(24),
// already have an account
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          h500("Already have an account?", 12,
                              color: lightGrey),
                          h400(" Log In", 12, color: appColor)
                        ],
                      ),
                      onTap: () => pushandreplace(context, const Signin()),
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
  onRegister(auth) {
    if (auth["status"] == false) {
      setState(() => isLoading = false);
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
    setState(() => isLoading = false);
    // regiatration successful snackbar
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Registration successful"),
    ));
    // regiatration successful snackbar
    pushandreplace(context, const LandingPage());
  }
}
