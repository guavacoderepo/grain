import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/spacer.dart';
import 'package:intl/intl.dart';
import '../../datamodels/farmersModel.dart';
import '../../models/farmers.dart';
import '../../utilities/carddesign.dart';
import '../../utilities/font.dart';

class ViewFarm extends StatefulWidget {
  Datum data;
  ViewFarm(this.data, {super.key});

  @override
  State<ViewFarm> createState() => _ViewFarmState();
}

class _ViewFarmState extends State<ViewFarm> {
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
              child: h500(widget.data.name, 15, color: appColor),
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
              child: h400("Farm Size: ${widget.data.farmSize}sqkm", 13,
                  color: lightGrey),
            ),

            // font3("${data[len - i - 1].location.s}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400(
                  "Planted on: ${DateFormat('dd/MM/yyyy').format(widget.data.plantDate!)}",
                  13,
                  color: lightGrey),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400left(widget.data.description, 13, color: lightGrey),
            ),

            // font3("${data[len - i - 1].location.s}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: h400(
                  "Posted on: ${DateFormat('dd/MM/yyyy').format(widget.data.createdAt!)}",
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
              child: FutureBuilder<FarmersModel>(
                future: famersClass(),
                builder: (context, s) {
                  var data = s.data!.data!;
                  if (s.hasData) {
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
                        DateFormat('dd/MM/yyyy').format(data[index].createdAt!),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(color: appColor),
                    );
                  }
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
