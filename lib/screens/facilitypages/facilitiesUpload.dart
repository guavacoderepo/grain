import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:grain/datamodels/userModel.dart';
import 'package:grain/models/uploads.dart';
import 'package:grain/models/user.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';
import 'package:grain/utilities/input.dart';
import 'package:file_picker/file_picker.dart';
import 'package:grain/utilities/spacer.dart';
import 'package:provider/provider.dart';

class FacilityUpload extends StatefulWidget {
  const FacilityUpload({super.key});

  @override
  State<FacilityUpload> createState() => _FacilityUploadState();
}

class _FacilityUploadState extends State<FacilityUpload> {
  String? uploadImgPath = "";
  PlatformFile? file;
  String? filePath = "";
  bool isloading = false;

  String preset = "el4dcj9v";
  String cloudName = "dbzmy3wow";

  final cloudinary = Cloudinary.unsignedConfig(
    cloudName: "dbzmy3wow",
  );

  final TextEditingController _number = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _size = TextEditingController();
  final TextEditingController _des = TextEditingController();

  Future uploadimg() async {
    final response = await cloudinary.unsignedUpload(
      file: filePath,
      uploadPreset: preset,
      resourceType: CloudinaryResourceType.image,
    );

    if (response.isSuccessful) {
      setState(() => uploadImgPath = response.secureUrl!);
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<User>(context).user;
    return Scaffold(
      appBar: customeAppBar(context, "Upload Facility Details"),
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
                    const SizedBox(height: 10),
                    h300("Phone Number", 12),
                    input(_number, hint: "Hint: 09087569809"),
                    const SizedBox(height: 10),
                    h300("Facility Location", 12),
                    input(_location, hint: "Hint: Uto Lagos state"),

                    const SizedBox(height: 10),
                    h300("Storage Capacity", 12),
                    input(_size, hint: "Hint: 300tones"),
                    const SizedBox(height: 10),
                    h300("Description", 12),
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
                        horizontal(10),
                        h300("Choose image", 13)
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
                          if (_number.text.isEmpty ||
                              _des.text.isEmpty ||
                              _location.text.isEmpty ||
                              _size.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Empty fields"),
                            ));
                            return;
                          }
                          setState(() => isloading = true);
                          // upload image
                          await uploadimg();
                          // upload data

                          uploadFacility(
                                  user.fullName,
                                  _location.text,
                                  _size.text,
                                  _des.text,
                                  user.id,
                                  _number.text,
                                  uploadImgPath)
                              .then((value) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Done"),
                            ));
                            setState(() => isloading = false);
                            Navigator.pop(context);
                          });
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
