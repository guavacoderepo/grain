import 'package:flutter/material.dart';
import 'package:grain/utilities/colors.dart';

customeAppBar(title) => AppBar(
      backgroundColor: deepGreen,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        )
      ],
    );
