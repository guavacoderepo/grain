import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:grain/models/facilities.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/spacer.dart';
import 'package:intl/intl.dart';
import '../../datamodels/facilitieModel.dart';
import '../../utilities/carddesign.dart';
import '../../utilities/font.dart';

class ViewFacilities extends StatefulWidget {
  final Datum data;
   const ViewFacilities(this.data, {super.key});

  @override
  State<ViewFacilities> createState() => _ViewFacilitiesState();
}

class _ViewFacilitiesState extends State<ViewFacilities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBar(context, widget.data.name),
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
                  widget.data.imgUrl!,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            vertical(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h500("${widget.data.name} Facility", 15, color: appColor),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400("Location: ${widget.data.location}", 13,
                  color: lightGrey),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400("Contact number: ${widget.data.tel}", 13,
                  color: lightGrey),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400("Facility Size: ${widget.data.size} sqkm", 13,
                  color: lightGrey),
            ),

            // font3("${data[len - i - 1].location.s}"),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400left(widget.data.description, 13, color: lightGrey),
            ),

            // font3("${data[len - i - 1].location.s}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400(
                  "Posted on:  ${DateFormat("dd/MM/yyy").format(widget.data.createdAt!)}",
                  13,
                  color: lightGrey),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400("Related post", 15),
            ),

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
                    builder: (ctx, index) => buildCard(
                      data[index].imgUrl,
                      data[index].name,
                      "Size: ${data[index].size}",
                      data[index].location,
                      DateFormat("dd/MM/yyy").format(data[index].createdAt!),
                    ),
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
