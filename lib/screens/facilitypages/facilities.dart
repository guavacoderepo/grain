import 'package:flutter/material.dart';
import 'package:grain/models/facilityclass.dart';
import 'package:grain/screens/facilitypages/Viewfacility.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';
import 'facilitiesUpload.dart';

class StorageFacilities extends StatefulWidget {
  const StorageFacilities({super.key});

  @override
  State<StorageFacilities> createState() => _StorageFacilitiessCornertate();
}

class _StorageFacilitiessCornertate extends State<StorageFacilities> {
  Future<List<FacilityData>>? facilitydata;

  @override
  void initState() {
    facilitydata = getfacilty();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar section
      appBar: customeAppBar(context,"Storage Facilities"),

      // body section
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: StreamBuilder<List<FacilityData>>(
          stream: streamfacilty(),
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
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewFacilities(
                              data[len - i - 1].name,
                              data[len - i - 1].location,
                              data[len - i - 1].date,
                              data[len - i - 1].contact,
                              data[len - i - 1].size,
                              data[len - i - 1].des,
                              data[len - i - 1].img)),
                    ),
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
                              font1(data[len - i - 1].name),
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
              return Center(
                child: CircularProgressIndicator(
                  color: deepGreen.withOpacity(0.5),
                ),
              );
            }
          },
        ),
      ),

// flaoting button
      floatingActionButton: FloatingActionButton(
        backgroundColor: deepGreen,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FacilityUpload()),
        ),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
