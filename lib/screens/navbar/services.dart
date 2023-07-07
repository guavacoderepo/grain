import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:grain/screens/viewservices.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';
import 'package:grain/utilities/routers.dart';

import '../../utilities/appbar.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  List img = [
    "assets/images/img1.png",
    "assets/images/imgx.png",
    "assets/images/imgxx.png",
    "assets/images/img5.png",
  ];

  List text = [
    "Herbicide",
    "Fertilizer/Organic",
    "Seeding",
    "Machanization",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBar(context, "Services"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: DynamicHeightGridView(
            itemCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            builder: (ctx, index) => InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    color: appColor,
                    image: DecorationImage(
                      image: AssetImage(img[index]),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: h400(text[index], 15, color: light),
                  ),
                ),
              ),
              onTap: () => push(context, Viewservices(text[index])),
            ),
          ),
        ),
      ),
    );
  }
}
