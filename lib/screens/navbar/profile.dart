import 'package:flutter/material.dart';
import 'package:grain/screens/onboarding/signin.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/spacer.dart';
import 'package:provider/provider.dart';
import '../../datamodels/userModel.dart';
import '../../models/user.dart';
import '../../utilities/appbar.dart';
import '../../utilities/font.dart';
import '../../utilities/routers.dart';
import '../../utilities/sharepref.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String imgurl = "assets/avatar/ava1.png";

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<User>(context).user;
    return Scaffold(
// background color
      backgroundColor: light,
// appbar
      appBar: customeAppBar(context, "Profile"),
// main body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vertical(30),
// header section
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
// avater image or initial
// if image url is null set image to a default image
                  vertical(30),
                  user.imgUrl == null
                      ? CircleAvatar(
                          radius: 55,
                          backgroundColor: bgGrey,
                          backgroundImage: AssetImage(imgurl))
                      : CircleAvatar(
                          radius: 55,
                          backgroundColor: bgGrey,
                          backgroundImage: NetworkImage(user.imgUrl)
// get firts letter of username for icon
                          ),
                  horizontal(20),
// user details
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
// user details
                    children: [
                      h400(user.fullName ?? "null", 20, color: lightGrey),
                      h500(user.email ?? "null".toUpperCase(), 15),
// edit profile btn
                    ],
                  ),
                ],
              ),
              vertical(30),
// user data section

              ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  leading: Icon(Icons.person, color: appColor),
                  title: h400("Profile Details", 15),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () => {}),
              ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  leading: Icon(Icons.upload, color: appColor),
                  title: h400("Uploads", 15),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {}),
              ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  leading: Icon(Icons.lock, color: appColor),
                  title: h400("Password Setting", 15),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {}),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                leading: Icon(Icons.today_outlined, color: appColor),
                title: h400("FAQ", 15),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              ),
              ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  leading: Icon(Icons.help, color: appColor),
                  title: h400("Help", 15),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () => {}),

              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                leading: Icon(Icons.logout, color: appColor),
                title: h400("Log Out", 15, color: appColor),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                onTap: () async {
                  await removeToken();

                  pushandreplace(context, const Signin());
                },
              ),

              vertical(10)
// add data here
            ],
          ),
        ),
      ),
    );
  }
}
