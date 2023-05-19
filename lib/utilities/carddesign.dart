import 'package:flutter/material.dart';
import 'package:grain/utilities/font.dart';
import 'package:grain/utilities/spacer.dart';
import 'package:iconly/iconly.dart';
import 'colors.dart';

buildCard(img, name, price, loc, date) => Container(
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
                h500(name, 10),
                vertical(5),
                h600(price, 8),
                vertical(5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    h500("⟟ $loc", 10),
                    h500(date, 8),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );

buildlistCard(context, name, location, size, tell, img) => SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBe,
        children: <Widget>[
// add image section
          SizedBox(
            width: 120,
            height: 100,
            child: Image.network(
              img,
              fit: BoxFit.cover,
            ),
          ),
          horizontal(5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: h500(name, 12),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                      children: [
                        const Icon(IconlyLight.location),
                        h500(location, 10, color: lightGrey),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    h500('Size: $size', 12, color: lightDark),
                    ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(backgroundColor: appColor),
                      // child: h500("Contact seller", 8, color: light),
                      child: h500(tell, 8, color: light),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
