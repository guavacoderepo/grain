import 'package:flutter/material.dart';

font1(text, {Color color = const Color(0xff223D0D)}) => Text(
      text,
      style: TextStyle(fontSize: 15, color: color),
    );

font2(text, {Color color = const Color(0xff223D0D)}) => Text(
      text,
      style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w500),
    );

font3(text, {Color color = const Color.fromARGB(255, 99, 100, 99)}) => Text(
      text,
      style: TextStyle(fontSize: 11, color: color),
    );
