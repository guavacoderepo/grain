import 'package:flutter/material.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/input.dart';

customeAppBar(context, title) => AppBar(
      backgroundColor: appColor,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      // leading: IconButton(
      //     onPressed: () => Navigator.pop(context),
      //     icon: const Icon(Icons.arrow_back_rounded)),
    );

class AppBarContent extends StatelessWidget {
  final dynamic title, search;

  const AppBarContent(this.title, this.search, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: searchField(search),
        )
      ],
    );
  }
}
