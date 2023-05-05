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

font4(text, {Color color = const Color(0xff223D0D)}) => Text(
      text,
      style: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.w600),
    );

// new design fonts
Text h100(text, double size, {Color color = Colors.black}) => Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w100,
        color: color,
      ),
    );

// fontweigth 200
Text h200(text, double size, {Color color = Colors.black}) => Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w200,
        color: color,
      ),
    );

// fontweight 300
Text h300(text, double size, {Color color = Colors.black}) => Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w300,
        color: color,
      ),
    );

// fontweight 400
Text h400(text, double size, {Color color = Colors.black}) => Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );

// fontweight 400 align left
Text h400left(text, double size, {Color color = Colors.black}) => Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );

// fontweight 500
Text h500(text, double size, {Color color = Colors.black}) => Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );

// fontweight 600
Text h600(text, double size, {Color color = Colors.black}) => Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );

// fontweight 700
Text h700(text, double size, {Color color = Colors.black}) => Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
