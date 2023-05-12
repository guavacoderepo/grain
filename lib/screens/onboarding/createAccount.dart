import 'package:flutter/material.dart';
import '../../utilities/colors.dart';
import '../../utilities/font.dart';
import '../../utilities/input.dart';
import '../../utilities/spacer.dart';
import '../../utilities/submitbtn.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _farmer = true;
  bool _facilties = false;

  String? dropdownvalue = 'Farmer';

  // List of items in our dropdown menu
  var items = [
    'Farmer',
    'Facility Owner',
  ];

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
                    h600("Create Account", 20),
                    vertical(10),
                    h400("Sign up to get started", 12),
                    vertical(15),
// input section
// name section
                    h300("Name", 14, color: lightGrey),
                    vertical(4),
                    textField("Enter Name"),
                    vertical(15),

// email section
                    h300("Email", 14, color: lightGrey),
                    vertical(4),
                    textField("Enter email address"),
                    vertical(15),
// phone number section
                    h300("Phone Number", 14, color: lightGrey),
                    vertical(4),
                    textField("Enter phone number"),
                    vertical(15),
// password section
                    h300("Password", 14, color: lightGrey),
                    vertical(4),
                    passwordField("Enter Password", true, () {}),

                    vertical(15),

                    DropdownButton(
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                    vertical(80),
// submittion button
                    submitbtn(context, "Create Account", () {}),
                    vertical(24),
// already have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        h500("Already have an account?", 12, color: lightGrey),
                        h400(" Log In", 12, color: appColor)
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
