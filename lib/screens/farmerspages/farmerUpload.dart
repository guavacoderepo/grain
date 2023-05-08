import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';
import 'package:grain/utilities/input.dart';
import 'package:file_picker/file_picker.dart';

class FarmerUpload extends StatefulWidget {
  const FarmerUpload({super.key});

  @override
  State<FarmerUpload> createState() => _FarmerUploadState();
}

class _FarmerUploadState extends State<FarmerUpload> {
  String? uploadImgPath = "";
  PlatformFile? file;
  String? filePath = "";
  String? fileName = "";

  final TextEditingController _crop = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _size = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _des = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBar(context, "Upload Farm Details"),
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

                    h300("Crop Spicie", 13),
                    input(_crop, hint: "Hint: Red Maize"),
                    const SizedBox(height: 10),
                    h300("Phone Number", 13),
                    input(_number, hint: "Hint: 09087569809"),
                    const SizedBox(height: 10),
                    h300("Location", 13),
                    input(_location, hint: "Hint: Gwarimpa Abuja"),
                    const SizedBox(height: 10),
                    h300("Planting Date", 13),
                    input(_date, hint: "Hint: dd/mm/yyyy"),
                    const SizedBox(height: 10),
                    h300("Farm Size", 13),
                    input(_size, hint: "Hint: 23sqKm"),
                    const SizedBox(height: 10),
                    h300("Description", 13),
                    input(_des, hint: "Enter it here", x: 4),
                    const SizedBox(height: 10),

// upolad image
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: InkWell(
                            onTap: () async => _imgPicker(),
                            child: filePath == ""
                                ? Image.network(
                                    "https://static.wikia.nocookie.net/find-the-markers-roblox/images/5/5f/Placeholder.jpg/revision/latest?cb=20220313030844",
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(File(filePath!)),
                          ),
                        ),
                        font3("Choose image")
                      ],
                    ),
                    const SizedBox(height: 20),
// submit button
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          var splitdate = _date.text.split("/");

                          if (splitdate.length != 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: font3("check date formate",
                                    color: Colors.white),
                              ),
                            );
                            return;
                          }

// end of function
                        },
                        child: font1("Post", color: Colors.white),
                        style: TextButton.styleFrom(backgroundColor: appColor),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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

  void _imgPicker() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    try {
      if (result != null) {
        file = result.files.first;
        setState(() {
          filePath = file!.path;

          fileName = file!.name;
          // print(fileName);
        });
        // print(filePath);
      } else {
        // User canceled the picker
      }
    } catch (e) {
      // print(e);
    }
  }
}
