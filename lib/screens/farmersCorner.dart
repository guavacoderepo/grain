import 'package:flutter/material.dart';
import 'package:grain/models/farmersClass.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';

class FarmersCorner extends StatefulWidget {
  const FarmersCorner({super.key});

  @override
  State<FarmersCorner> createState() => _FarmersCornersCornertate();
}

class _FarmersCornersCornertate extends State<FarmersCorner> {
  // current idex
  int _currentIndex = 0;
  Future<List<FarmersData>>? farmdate;

  @override
  void initState() {
    // farmdate = getFarms("Muna Zame", "Ibi Taraba state", DateTime.now(),
    //     "contact", DateTime.utc(2023, 3, 0), "crop");

    farmdate = getfarmers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar section
      appBar: customeAppBar("FarmersCorner Corner"),

      // body section
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: FutureBuilder<List<FarmersData>>(
              future: farmdate,
              builder: (context, snap) {
                if (snap.hasData) {
                  var data = snap.data!;
                  return Center(
                    child: ListView.separated(
                      separatorBuilder: (context, i) => const Divider(),
                      itemCount: data.length,
                      itemBuilder: (context, i) => Container(
                        color: Colors.grey[200],
                        height: 300,
                        width: double.infinity,
                        // color: bgGrey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 200,
                              child: Image.network(
                                data[i].img,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  font1(data[i].crop),
                                  font2(data[i].location),
                                  const SizedBox(height: 10),
                                  // font1("Main grain title"),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: font3(
                                        "${data[i].date.day}/${data[i].date.month}/${data[i].date.year}"),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: deepGreen.withOpacity(0.5),
                    ),
                  );
                }
              })),

      // flaoting button
      floatingActionButton: FloatingActionButton(
        backgroundColor: deepGreen,
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),

      // bottom nav
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: deepGreen,
        unselectedItemColor: lightGrey,
        elevation: 0,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.rice_bowl_outlined), label: "Farmer"),
          BottomNavigationBarItem(
              icon: Icon(Icons.house_siding_outlined), label: "Facilities"),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services_outlined), label: "Services")
        ],
        onTap: (value) => setState(() => _currentIndex = value),
      ),
    );
  }
}
