import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grain/datamodels/farmersModel.dart';
import 'package:grain/datamodels/userModel.dart';
import 'package:grain/models/user.dart';
import 'package:grain/screens/facilitypages/facilities.dart';
import 'package:grain/screens/notifications.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';
import 'package:grain/utilities/routers.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:provider/provider.dart';
import '../../datamodels/facilitieModel.dart';
import '../../models/facilities.dart';
import '../../models/farmers.dart';
import '../../utilities/carddesign.dart';
import '../../utilities/spacer.dart';
import 'package:iconly/iconly.dart';
import '../facilitypages/Viewfacility.dart';
import '../facilitypages/facilitiesUpload.dart';
import '../farmerspages/ViewFarm.dart';
import '../farmerspages/farmerUpload.dart';
import '../farmerspages/farmersCorner.dart';

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
    "Keep farmers close to facility owners"
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
    UserModel user = Provider.of<User>(context).user;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: light,
        title: h500("Hi ${user.fullName}!", 16),
        // leading: Icon(Icons.menu, color: dark),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Badge(
              isLabelVisible: user.isNotification!,
              child: IconButton(
                onPressed: () => push(context, const Notifications()),
                icon: Icon(
                  IconlyLight.notification,
                  color: dark,
                ),
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
                  h400("Crop & Harvest", 14),
                  InkWell(
                    child: h500("See all", 11, color: appColor),
                    onTap: () => push(context, const FarmersCorner()),
                  )
                ],
              ),
            ),

            // gridview of crop and harvest section
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              child: FutureBuilder(
                future: famersClass(),
                builder: (context, AsyncSnapshot<FarmersModel> s) {
                  var data = s.data!.data;
                  if (s.hasData && s.data!.data != null) {
                    return DynamicHeightGridView(
                      itemCount: 4,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      builder: (ctx, index) => InkWell(
                          child: buildCard(
                            data![index].imgUrl,
                            data[index].name,
                            "Size: ${data[index].farmSize}",
                            data[index].location,
                            DateFormat('dd/MM/yyyy')
                                .format(data[index].createdAt!),
                          ),
                          onTap: () => push(context, ViewFarm(data[index]))),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: appColor,
                      ),
                    );
                  }
                },
              ),
            ),

            vertical(15),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  h400("Storage facilities", 14),
                  InkWell(
                    child: h500("See all", 11, color: appColor),
                    onTap: () => push(context, const StorageFacilities()),
                  )
                ],
              ),
            ),

            // gridview of crop and harvest section
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: double.infinity,
              child: FutureBuilder<FacilitiesModel>(
                future: getFacilities(),
                builder: (context, s) {
                  var data = s.data!.data!;
                  return DynamicHeightGridView(
                    itemCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    builder: (ctx, index) => InkWell(
                      child: buildCard(
                        data[index].imgUrl,
                        data[index].name,
                        "Size: ${data[index].size ?? ""}",
                        data[index].location,
                        DateFormat('dd/MM/yyyy').format(data[index].createdAt!),
                      ),
                      onTap: () => push(context, ViewFacilities(data[index])),
                    ),
                  );
                },
              ),
            ),

            // add sections here
          ],
        ),
      ),

// float action buttom
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColor,
        onPressed: user.category == "farmer"
            ? () => push(context, const FarmerUpload())
            : () => push(context, const FacilityUpload()),
        child: Icon(
          IconlyLight.upload,
          color: light,
        ),
      ),

// bottom nav section
    );
  }
}
