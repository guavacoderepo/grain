import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/spacer.dart';
import '../../datamodels/farmersModel.dart';
import '../../models/farmers.dart';
import '../../utilities/carddesign.dart';
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
      appBar: customeAppBar(context, "Olams farms Limited"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Hero(
                tag: 2.toString(),
                child: Image.network(
                  "https://blog.agribazaar.com/wp-content/uploads/2021/04/Farmer_harvesting_wheat_PTI_1200.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            vertical(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h500("Cassava seed", 15, color: appColor),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400("Location: Takum ibi ladi", 13, color: lightGrey),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400("Contact number: 0908973826", 13, color: lightGrey),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400("Farm Size: 34589sqkm", 13, color: lightGrey),
            ),

            // font3("${data[len - i - 1].location.s}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400("Planted on: 23/4/2022", 13, color: lightGrey),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400left(
                  "Description:\nOur silos, either flat or hopper bottom, are used for extended storage of large quantities of grain, seeds and granulate products. Our range of concrete base silos cover capacities ranging from 83 m3 to 45,055 m3 and with diameters from 4.58 m to 41.25 m.",
                  13,
                  color: lightGrey),
            ),

            // font3("${data[len - i - 1].location.s}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400("Posted on: 23/4/2030", 13, color: lightGrey),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400("Related post", 15),
            ),

            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              child: FutureBuilder<FarmersModel>(
                future: famersClass(),
                builder: (context, s) {
                  var data = s.data!.data!;
                  return DynamicHeightGridView(
                    itemCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    builder: (ctx, index) => buildCard(
                        data[index].imgUrl,
                        data[index].name,
                        data[index].farmSize,
                        data[index].location,
                        data[index].createdAt),
                  );
                },
              ),
            ),
            vertical(10)
          ],
        ),
      ),
    );
  }
}
