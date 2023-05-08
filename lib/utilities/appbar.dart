import 'package:flutter/material.dart';
import 'package:grain/utilities/colors.dart';
import 'package:grain/utilities/input.dart';

customeAppBar(context,title) => AppBar(
      backgroundColor: appColor,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      leading: IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
            ),
          ),
        )
      ],
    );

class AppBarContent extends StatelessWidget {
  const AppBarContent({super.key});

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
              const Text(
                'Farmers Corner',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: searchField("Corn, maize, beans , rice seeds etc"),
        )
      ],
    );
  }
}
