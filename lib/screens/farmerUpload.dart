import 'package:flutter/material.dart';
import 'package:grain/models/farmersClass.dart';
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
  String? filePath;
  String? fileName;

  final TextEditingController _name = TextEditingController();
  final TextEditingController _crop = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _size = TextEditingController();
  final TextEditingController _date = TextEditingController();

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
                    input(_name, hint: "Hint: Abba Sadi"),
                    const SizedBox(height: 10),
                    font1("Crop Spicie"),
                    input(_crop, hint: "Hint: Red Maize"),
                    const SizedBox(height: 10),
                    font1("Phone Number"),
                    input(_number, hint: "Hint: 09087569809"),
                    const SizedBox(height: 10),
                    font1("Location"),
                    input(_location, hint: "Hint: Gwarimpa Abuja"),
                    const SizedBox(height: 10),
                    font1("Planting Date"),
                    input(_date, hint: "Hint: dd/mm/yyyy"),
                    const SizedBox(height: 10),
                    font1("Farm Size"),
                    input(_size, hint: "Hint: 23sqKm"),
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
                            child: Image.network(
                              "https://static.wikia.nocookie.net/find-the-markers-roblox/images/5/5f/Placeholder.jpg/revision/latest?cb=20220313030844",
                              fit: BoxFit.cover,
                            ),
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
                        onPressed: () {
                          var splitdate = _date.text.split("/");

                          if (splitdate.length != 3) {
                            return;
                          }
                          setState(() {
                            addFarms(
                              _name.text,
                              _location.text,
                              DateTime.now(),
                              _number.text,
                              DateTime.utc(
                                int.parse(splitdate[2]),
                                int.parse(splitdate[1]),
                                int.parse(splitdate[0]),
                              ),
                              _crop.text,
                            );
                          });
                        },
                        child: font1("Post", color: Colors.white),
                        style: TextButton.styleFrom(backgroundColor: deepGreen),
                      ),
                    ),
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

    if (result != null) {
      file = result.files.first;
      setState(() {
        // filePath = file!.path;

        fileName = file!.name;
        // print(fileName);
      });
      // print(filePath);
    } else {
      // User canceled the picker
    }
  }
}
