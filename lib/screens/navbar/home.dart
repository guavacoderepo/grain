import 'package:flutter/material.dart';
import 'package:grain/utilities/colors.dart';
import 'package:marquee/marquee.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: light,
        leading: Icon(Icons.menu, color: dark),
        elevation: 0,
      ),

      // body section
      body: Column(
        children: [
          // header section
          Container(
            height: 200,
            width: double.infinity,
            color: lightgreen,
          ),
          Marquee(
            text: 'There once was a boy who told this story about a boy:',
          )
        ],
      ),
    );
  }
}
