import 'package:flutter/material.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';
import '../utilities/appbar.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBar(context,"Company Servies"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              cardDesign(
                "O",
                "Olams Nigeria Limited",
                "Giving 2 bags of firtilizers to all fermers in nigeria",
              ),
              const SizedBox(
                height: 10,
              ),
              cardDesign(
                "W",
                "Wacot Nigeria Limited",
                "We are giving farm tools to farmers below the age of 40 to improve productivity",
              ),
              const SizedBox(
                height: 10,
              ),
              cardDesign(
                "F",
                "Fada Dutse Storage Limited",
                "Free farm for cultivation to all farmer in  abuja and Niger with firtilizers",
              ),
              const SizedBox(
                height: 10,
              ),
              cardDesign(
                "G",
                "Gida Idi Farms and Sons",
                "We promote agriculture by promoting lives of farmers in taraba state",
              ),
              const SizedBox(
                height: 10,
              ),
              cardDesign(
                "P",
                "Peter Cheast Storage",
                "An american empowered company to help promote farming in sub sahara nigeria with farm tools",
              ),
            ],
          ),
        ),
      ),
    );
  }

  cardDesign(s, n, d) => ListTile(
        contentPadding: const EdgeInsets.all(10),
        tileColor: bgGrey,
        leading: CircleAvatar(
          backgroundColor: Colors.grey,
          child: font4(s),
        ),
        title: font1(n),
        subtitle: font3(d),
        // trailing: const Icon(Icons.arrow_forward_ios_rounded),
      );
}
