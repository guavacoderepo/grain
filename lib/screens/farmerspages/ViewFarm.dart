import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';

import '../../utilities/font.dart';


class ViewFarm extends StatefulWidget {
  String crop, contact, location, name, img, des, size;
  DateTime date, time;
  ViewFarm(this.name, this.location, this.date, this.contact, this.time,
      this.crop, this.size, this.des, this.img,
      {super.key});

  @override
  State<ViewFarm> createState() => _ViewFarmState();
}

class _ViewFarmState extends State<ViewFarm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBar("${widget.crop}, ${widget.location}"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  widget.img,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              font3("Crop: ${widget.crop}"),
              const SizedBox(height: 10),
              font3("Location: ${widget.location}"),
              const SizedBox(height: 10),

              font3("Farm Size: ${widget.size}"),
              const SizedBox(height: 10),

              font3("Contact number: ${widget.contact}"),
              const SizedBox(height: 10),

              font3("Farm Size: ${widget.size}"),
              const SizedBox(height: 10),

              // font3("${data[len - i - 1].location.s}"),
              font3(
                  "Planted on: ${widget.time.day}/${widget.time.month}/${widget.time.year}"),
              const SizedBox(height: 10),

              font3("Description:\n${widget.des}"),
              const SizedBox(height: 10),
              // font3("${data[len - i - 1].location.s}"),
              font3(
                  "Posted on: ${widget.date.day}/${widget.date.month}/${widget.date.year}")
            ],
          ),
        ),
      ),
    );
  }
}
