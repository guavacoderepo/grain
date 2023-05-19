import 'dart:io';
import 'package:flutter/material.dart';
import 'package:grain/datamodels/userModel.dart';
import 'package:grain/models/uploads.dart';
import 'package:grain/models/user.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';
import 'package:grain/utilities/input.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:cloudinary/cloudinary.dart';

class FarmerUpload extends StatefulWidget {
  const FarmerUpload({super.key});

  @override
  State<FarmerUpload> createState() => _FarmerUploadState();
}

class _FarmerUploadState extends State<FarmerUpload> {
  String? uploadImgPath = "";
  DateTime? pdate;
  DateTime? hdate;
  PlatformFile? file;
  String? filePath = "";
  bool isloading = false;

  String preset = "el4dcj9v";
  String cloudName = "dbzmy3wow";

  final cloudinary = Cloudinary.unsignedConfig(
    cloudName: "dbzmy3wow",
  );

  final TextEditingController _crop = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _size = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _hdate = TextEditingController();
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
// start here
                    h300("Planting Date", 13),
                    dateField(
                      "Hint: dd/mm/yyyy",
                      _date,
                      () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);

                          setState(() {
                            _date.text = formattedDate;
                            pdate = pickedDate;
                          });
                        }
                      },
                    ),

                    const SizedBox(height: 10),
                    h300("Farm Size", 13),
                    input(_size, hint: "Hint: 23sqKm"),
// start here
                    const SizedBox(height: 10),
                    h300("Harvest Date", 13),
                    dateField(
                      "Hint: dd/mm/yyyy",
                      _hdate,
                      () async {
                        DateTime? pickedDate1 = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101));

                        if (pickedDate1 != null) {
                          String formattedDate1 =
                              DateFormat('yyyy-MM-dd').format(pickedDate1);

                          setState(() {
                            _hdate.text = formattedDate1;
                            hdate = pickedDate1;
                          });
                        }
                      },
                    ),
// end date here
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
                        onPressed: !isloading
                            ? () async {
                                if (_crop.text.isEmpty ||
                                    _des.text.isEmpty ||
                                    _date.text.isEmpty ||
                                    _hdate.text.isEmpty ||
                                    _location.text.isEmpty ||
                                    _number.text.isEmpty ||
                                    _size.text.isEmpty) {
                                  print("empty field");
                                  return;
                                }

                                setState(() => isloading = true);
                                // upload image
                                await uploadimg();
                                // upload data

                                uploadFarm(
                                        user.fullName,
                                        _crop.text,
                                        pdate!,
                                        _location.text,
                                        _size.text,
                                        _des.text,
                                        user.id,
                                        _number.text,
                                        hdate!,
                                        uploadImgPath)
                                    .then((value) {
                                  print("done ");
                                  setState(() => isloading = false);
                                  Navigator.pop(context);
                                });
// end of function
                                setState(() => isloading = false);
                              }
                            : null,
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
      // print(e);
    }
  }
}
