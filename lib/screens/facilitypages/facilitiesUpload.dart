import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grain/models/facilityclass.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';
import 'package:grain/utilities/input.dart';
import 'package:file_picker/file_picker.dart';

class FacilityUpload extends StatefulWidget {
  const FacilityUpload({super.key});

  @override
  State<FacilityUpload> createState() => _FacilityUploadState();
}

class _FacilityUploadState extends State<FacilityUpload> {
  String? uploadImgPath = "";
  PlatformFile? file;
  String? filePath = "";
  String? fileName = "";

  final TextEditingController _name = TextEditingController();
  final TextEditingController _crop = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _size = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _des = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customeAppBar("Upload Facility Details"),
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
                    font1("Company's Name"),
                    input(_name, hint: "Hint: Olams Nigeria Limited"),

                    const SizedBox(height: 10),
                    font1("Phone Number"),
                    input(_number, hint: "Hint: 09087569809"),
                    const SizedBox(height: 10),
                    font1("Facility Location"),
                    input(_location, hint: "Hint: Uto Lagos state"),

                    const SizedBox(height: 10),
                    font1("Storage Capacity"),
                    input(_size, hint: "Hint: 300tones"),
                    const SizedBox(height: 10),
                    font1("Description"),
                    input(_des, hint: "Enter it Description", x: 5),
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
// add to farms
                          setState(() {
                            addfacilty(
                              _name.text,
                              _location.text,
                              DateTime.now(),
                              _number.text,
                              _des.text,
                              _size.text,
                            );
                          });
// post farm

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: font3("Facility uploaded successfully",
                                  color: Colors.white),
                            ),
                          );
                          Navigator.pop(context);
// end of function
                        },
                        child: font1("Post", color: Colors.white),
                        style: TextButton.styleFrom(backgroundColor: deepGreen),
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
      print(e);
    }
  }
}
