import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';
import '../../utilities/font.dart';

class ViewFacilities extends StatefulWidget {
  String contact, location, name, img, des, size;
  DateTime date;
  ViewFacilities(this.name, this.location, this.date, this.contact, this.size,
      this.des, this.img,
      {super.key});

  @override
  State<ViewFacilities> createState() => _ViewFacilitiesState();
}

class _ViewFacilitiesState extends State<ViewFacilities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBar(context, "${widget.name}, ${widget.location}"),
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

              const SizedBox(height: 20),
              font3("Company's Name: ${widget.name}"),
              const SizedBox(height: 10),
              font3("Storage Location: ${widget.location}"),
              const SizedBox(height: 10),

              font3("Contact number: ${widget.contact}"),
              const SizedBox(height: 10),

              font3("Storage Capacity: ${widget.size}"),
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
