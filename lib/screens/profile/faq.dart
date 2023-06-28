import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
// bg color
      backgroundColor: light,
// appbar section
      appBar: customeAppBar(context, "FAQ"),
// app body section
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 0),
        child: ListView.separated(
          itemBuilder: (context, i) => ExpansionTile(
            title: h400("Faq tile question", 15),
            // subtitle: h400("Faq question subtitle", 12),
            children: [
              h400(
                "A frequently asked questions list is often used in articles, websites, email lists, and online forums where common questions tend to recur, for example through posts or queries by new users related to common",
                12,
              ),
            ],
          ),
          separatorBuilder: (context, i) => const Divider(),
          itemCount: 10,
        ),
      ),
    );
  }
}
