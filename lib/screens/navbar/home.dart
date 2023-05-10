import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grain/screens/farmerspages/ViewFarm.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';
import 'package:marquee/marquee.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import '../../utilities/carddesign.dart';
import '../../utilities/spacer.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  int textIndex = 0;
  List headerText = [
    "Revolutionize Your Harvest",
    "Maximize your profit and minimize lost",
    "Keep farms close to facility owners"
  ];

// control text change
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        textIndex = textIndex + 1;
        if (textIndex > headerText.length - 1) {
          textIndex = 0;
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: light,
        title: h500("Hi there! ", 16),
        // leading: Icon(Icons.menu, color: dark),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 20),
            child: Badge(
              child: Icon(
                IconlyLight.notification,
                color: dark,
              ),
            ),
          )
        ],
        elevation: 0,
      ),

// body section
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // header section
            Container(
              height: 200,
              width: double.infinity,
              color: appColor,
              child: Stack(
                children: [
                  // text section
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        h500animation(headerText[textIndex], 17, color: light),
                        h500("Get started today!", 12, color: dark)
                      ],
                    ),
                  ),
                  // header image section
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.5,
                    bottom: 0,
                    top: 0,
                    child: Image.asset("assets/images/homeimg.png"),
                  )
                ],
              ),
            ),

            // marquee section
            Row(
              children: [
                Container(
                  width: 100,
                  height: 30,
                  color: redcolor,
                  child: h400("Live Price", 15, color: light),
                ),
                Expanded(
                  child: SizedBox(
                    height: 30,
                    child: Marquee(
                      style: const TextStyle(fontSize: 12),
                      text:
                          "Rice: #4,555.9,  Beans: #10,999.3,  White Maize: #3,888.9,  Red Maize: #5,777.9,  ",
                    ),
                  ),
                )
              ],
            ),

            vertical(10),
            // main content body section
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: h500("Promotion Ads", 15, color: appColor),
            ),

            // crop harvest section
            vertical(10),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  h500("Crop & Harvest", 14),
                  InkWell(
                    child: h500("See all", 11, color: appColor),
                  )
                ],
              ),
            ),

            // gridview of crop and harvest section
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              child: DynamicHeightGridView(
                itemCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                builder: (ctx, index) => buildCard(
                  "https://blog.agribazaar.com/wp-content/uploads/2021/04/Farmer_harvesting_wheat_PTI_1200.jpg",
                ),
              ),
            ),

            vertical(15),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  h500("Storage facilities", 14),
                  InkWell(
                    child: h500("See all", 11, color: appColor),
                  )
                ],
              ),
            ),

            // gridview of crop and harvest section
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              child: DynamicHeightGridView(
                itemCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                builder: (ctx, index) => InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewFarm())),
                  child: buildCard(
                    "https://datacenterlocations.com/wp-content/uploads/2020/10/rack-centre-planned-data-center-nigeria.jpg",
                  ),
                ),
              ),
            ),

            // add sections here
          ],
        ),
      ),

// float action buttom
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColor,
        child: Icon(
          IconlyLight.upload,
          color: light,
        ),
        onPressed: () {},
      ),

// bottom nav section
    );
  }
}
