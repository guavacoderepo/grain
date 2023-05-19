import 'package:flutter/material.dart';
import 'package:grain/utilities/appbar.dart';
import 'package:grain/utilities/carddesign.dart';
import 'package:grain/utilities/colors.dart';

class StorageFacilities extends StatefulWidget {
  const StorageFacilities({super.key});

  @override
  State<StorageFacilities> createState() => _StorageFacilitiessCornertate();
}

class _StorageFacilitiessCornertate extends State<StorageFacilities> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // appbar section
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(color: appColor),
            child: AppBarContent(
                "Storage Facilities", "facilities around you....."),
          ),
        ),

        // body section
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) =>
                buildlistCard(context, "", "", "", "", ""),
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ),
    );
  }
}
