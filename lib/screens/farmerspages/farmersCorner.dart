import 'package:flutter/material.dart';
import 'package:grain/models/farmersClass.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';
import 'package:grain/utilities/spacer.dart';
import 'package:iconly/iconly.dart';

class FarmersCorner extends StatefulWidget {
  const FarmersCorner({super.key});

  @override
  State<FarmersCorner> createState() => _FarmersCornersCornertate();
}

class _FarmersCornersCornertate extends State<FarmersCorner> {
  Future<List<FarmersData>>? farmdate;

  @override
  void initState() {
    farmdate = getfarmers();
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
            child: const AppBarContent(),
          ),
        ),

        // body section
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) => buildCard(),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ),
    );
  }

  buildCard() => SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBe,
          children: <Widget>[
// add image section
            SizedBox(
              width: 120,
              height: 100,
              child: Image.network(
                "https://blog.agribazaar.com/wp-content/uploads/2021/04/Farmer_harvesting_wheat_PTI_1200.jpg",
                fit: BoxFit.cover,
              ),
            ),
            horizontal(5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: h500('White beans seeds White beans seeds', 12),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Row(
                        children: [
                          const Icon(IconlyLight.location),
                          h500('Abuja', 10, color: lightGrey),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      h500('#2400/kg', 12, color: lightDark),
                      ElevatedButton(
                        onPressed: () {},
                        style:
                            ElevatedButton.styleFrom(backgroundColor: appColor),
                        child: h500("Contact seller", 8, color: light),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
