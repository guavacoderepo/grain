import 'package:flutter/material.dart';
import 'package:grain/utilities/colors.dart';

customeAppBar(title) => AppBar(
      backgroundColor: appColor,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
