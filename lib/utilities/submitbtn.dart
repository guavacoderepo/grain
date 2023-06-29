import 'package:flutter/material.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/font.dart';

submitbtn(context, String title, bool isloading, Function onClick) => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
        onPressed: isloading ? null : () => onClick(),
        style: ElevatedButton.styleFrom(
            backgroundColor: appColor, shape: const StadiumBorder()),
        child: h600(title, 12, color: light),
      ),
    );

submitbtnInact(context, title, Function onClick) => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        onPressed: () => onClick(),
        style: ElevatedButton.styleFrom(
            backgroundColor: appColor.withOpacity(0.6),
            shape: const StadiumBorder()),
        child: h600(title, 12, color: light),
      ),
    );

submitbtnOutline(context, title, Function onClick) => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: OutlinedButton(
        onPressed: () => onClick(),
        style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent, shape: const StadiumBorder()),
        child: h600(title, 12, color: lightGrey),
      ),
    );
