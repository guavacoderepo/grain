import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/carddesign.dart';
import 'package:grain/utilities/colors.dart';

class FarmersCorner extends StatefulWidget {
  const FarmersCorner({super.key});

  @override
  State<FarmersCorner> createState() => _FarmersCornersCornertate();
}

class _FarmersCornersCornertate extends State<FarmersCorner> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // appbar section
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(color: appColor),
            child:  AppBarContent("Famer's Corner", "Corn, maize, beans , rice seeds etc"),
          ),
        ),

        // body section
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) => buildlistCard(context),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ),
    );
  }
}
