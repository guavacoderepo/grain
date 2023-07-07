import 'package:flutter/material.dart';
import 'package:grain/datamodels/farmersModel.dart';
import 'package:grain/screens/farmerspages/ViewFarm.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/carddesign.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/routers.dart';

import '../../models/farmers.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarkssCornertate();
}

class _BookmarkssCornertate extends State<Bookmarks> {
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
        appBar: customeAppBar(context, "Bookmarks"),

        // body section
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          child: FutureBuilder<FarmersModel?>(
            future: famersClass(),
            builder: (context, s) {
              var data = s.data!.data!;
              if (s.hasData) {
                return ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) => InkWell(
                    child: buildlistCard(
                        context,
                        data[index].name,
                        data[index].location,
                        data[index].farmSize,
                        data[index].tel,
                        data[index].imgUrl),
                    onTap: () => push(context, ViewFarm(data[index])),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(color: appColor),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
