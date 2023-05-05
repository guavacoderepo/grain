import 'package:flutter/material.dart';
import 'package:grain/models/farmersClass.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/font.dart';

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
    return Scaffold(
      // appbar section
      appBar: customeAppBar("Farmers Corner"),

      // body section
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: StreamBuilder<List<FarmersData>>(
          stream: sreamfarm(),
          builder: (context, snap) {
            if (snap.hasData) {
              var data = snap.data!;
              var len = data.length;
              return ListView.separated(
                separatorBuilder: (context, i) => const Divider(),
                itemCount: len,
                itemBuilder: (context, i) => Container(
                  color: Colors.grey[200],

                  width: double.infinity,
                  // color: bgGrey,
                  child: InkWell(
                    // open view farmers page
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Image.network(
                            data[len - i - 1].img,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              font1(data[len - i - 1].crop),
                              font2(
                                  "${data[len - i - 1].location}, ${data[len - i - 1].size}"),
                              const SizedBox(height: 10),
                              // font3("${data[len - i - 1].location.s}"),
                              Align(
                                alignment: Alignment.topRight,
                                child: font3(
                                    "${data[len - i - 1].date.day}/${data[len - i - 1].date.month}/${data[len - i - 1].date.year}"),
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
              return const Center();
            }
          },
        ),
      ),
    );
  }
}
