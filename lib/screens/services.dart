import 'package:flutter/material.dart';
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
      appBar: customeAppBar("Company Servies"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
