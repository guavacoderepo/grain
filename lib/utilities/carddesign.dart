import 'package:flutter/material.dart';
import 'package:grain/utilities/font.dart';
import 'package:grain/utilities/spacer.dart';
import 'colors.dart';

buildCard(img) => Container(
      decoration: BoxDecoration(
          border: Border.all(color: bgGrey),
          borderRadius: BorderRadius.circular(5)),
      // height: 300,
      // color: appColor,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Image.network(
              img,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h500("Groundnut seeds", 10),
                vertical(5),
                h600("#140,000/T", 8),
                vertical(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    h500("⟟ Abia", 10),
                    h500("Jun/4/23", 8),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
