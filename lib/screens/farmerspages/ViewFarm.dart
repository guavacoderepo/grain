import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/spacer.dart';

import '../../utilities/font.dart';

class ViewFarm extends StatefulWidget {
  ViewFarm({super.key});

  @override
  State<ViewFarm> createState() => _ViewFarmState();
}

class _ViewFarmState extends State<ViewFarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBar("Olams farms Limited"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.network(
                "https://blog.agribazaar.com/wp-content/uploads/2021/04/Farmer_harvesting_wheat_PTI_1200.jpg",
                fit: BoxFit.cover,
              ),
            ),
            vertical(10),
            h500("Cassava seed", 15, color: appColor),
            vertical(10),
            h400("Location: Takum ibi ladi", 13),
            vertical(10),

            h400("Contact number: 0908973826", 13, color: lightGrey),
            vertical(10),

            h400("Farm Size: 34589sqkm", 13, color: lightGrey),
            vertical(10),

            // font3("${data[len - i - 1].location.s}"),
            h400("Planted on: 23/4/2022", 13, color: lightGrey),
            vertical(10),

            h400left(
                "Description:\nOur silos, either flat or hopper bottom, are used for extended storage of large quantities of grain, seeds and granulate products. Our range of concrete base silos cover capacities ranging from 83 m3 to 45,055 m3 and with diameters from 4.58 m to 41.25 m.",
                13,
                color: lightGrey),
            vertical(10),

            // font3("${data[len - i - 1].location.s}"),
            h400("Posted on: 23/4/2030", 13, color: lightGrey)
          ],
        ),
      ),
    );
  }
}
