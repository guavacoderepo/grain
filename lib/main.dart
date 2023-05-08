import 'package:flutter/material.dart';
import 'package:grain/screens/facilitypages/facilitiesUpload.dart';


void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "poppins"),
        home:  const FacilityUpload(),
      ),
    );
