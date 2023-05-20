import 'package:flutter/material.dart';
import 'package:grain/constants/url.dart';
import 'package:grain/screens/facilitypages/Viewfacility.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/carddesign.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/routers.dart';

import '../../datamodels/facilitieModel.dart';
import '../../models/facilities.dart';

class StorageFacilities extends StatefulWidget {
  const StorageFacilities({super.key});

  @override
  State<StorageFacilities> createState() => _StorageFacilitiessCornertate();
}

class _StorageFacilitiessCornertate extends State<StorageFacilities> {
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
            child: AppBarContent(
                "Storage Facilities", "facilities around you....."),
          ),
        ),

        // body section
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: FutureBuilder<FacilitiesModel>(
                future: getFacilities(),
                builder: (context, s) {
                  if (s.hasData) {
                    var data = s.data!.data!;
                    return ListView.separated(
                      itemCount: data.length,
                      itemBuilder: (context, i) => InkWell(
                        child: buildlistCard(
                          context,
                          data[i].name,
                          data[i].location,
                          data[i].size,
                          data[i].tel,
                          data[i].imgUrl,
                        ),
                        onTap: () => push(context, ViewFacilities(data[i])),
                      ),
                      separatorBuilder: (context, index) => const Divider(),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                          color: appColor, strokeWidth: 1),
                    );
                  }
                })),
      ),
    );
  }
}
