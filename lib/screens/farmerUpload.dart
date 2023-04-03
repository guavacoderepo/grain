import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';
import 'package:grain/utilities/input.dart';

class FarmerUpload extends StatefulWidget {
  const FarmerUpload({super.key});

  @override
  State<FarmerUpload> createState() => _FarmerUploadState();
}

class _FarmerUploadState extends State<FarmerUpload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBar("Upload Farm Details"),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    font1("Full Name"),
                    input(hint: "Hint: Abba Sadi"),
                    const SizedBox(height: 10),
                    font1("Crop Spicie"),
                    input(hint: "Hint: Red Maize"),
                    const SizedBox(height: 10),
                    font1("Phone Number"),
                    input(hint: "Hint: 09087569809"),
                    const SizedBox(height: 10),
                    font1("Location"),
                    input(hint: "Hint: Gwarimpa Abuja"),
                    const SizedBox(height: 10),
                    font1("Planting Date"),
                    input(hint: "Hint: dd/mm/yyyy"),
                    const SizedBox(height: 10),
                    font1("Farm Size"),
                    input(hint: "Hint: 23sqKm"),
                    const SizedBox(height: 10),

// upolad image
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        child: Image.network(
                            "https://static.wikia.nocookie.net/find-the-markers-roblox/images/5/5f/Placeholder.jpg/revision/latest?cb=20220313030844"),
                      ),
                    ),
                    const SizedBox(height: 20),
// submit button 
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        child: font1("Post", color: Colors.white),
                        style: TextButton.styleFrom(backgroundColor: deepGreen),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// String crop, contact, location, name, img;
// DateTime date, time;
