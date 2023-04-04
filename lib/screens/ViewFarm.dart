import 'package:flutter/material.dart';

class ViewFarm extends StatefulWidget {
  const ViewFarm({super.key});

  @override
  State<ViewFarm> createState() => _ViewFarmState();
}

class _ViewFarmState extends State<ViewFarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
