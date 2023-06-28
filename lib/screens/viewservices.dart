import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';

class Viewservices extends StatefulWidget {
  const Viewservices({super.key});

  @override
  State<Viewservices> createState() => _ViewservicesState();
}

class _ViewservicesState extends State<Viewservices> {
  List titles = ["Machines rent", "Chemical give away", "Hybrid maize Seed"];

  List subtitle = [
    "We are hiring machines for larg scale farming and we are giving discount to be paid afer harvesting, contact on afex@gmail.com or call us on 09043233423.",
    "We are doing a chimical give away for the first 20 customers to buy our maize big pro max package, contact us on cocoa@afex.com or call us on 08034568756",
    "We are selling a high quality hybrid maize seed for improved harvest.contact us on maizegiv@gmail.com or call 09089674567"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// bg color
      backgroundColor: light,
// appbar section
      appBar: customeAppBar(context, "Viewservices"),
// app body section
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView.separated(
          itemBuilder: (context, i) => ListTile(
            title: h400(titles[i], 15),
            subtitle: h400(subtitle[i], 12),
          ),
          separatorBuilder: (context, i) => const Divider(),
          itemCount: subtitle.length,
        ),
      ),
    );
  }
}
