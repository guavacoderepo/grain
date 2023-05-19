import 'package:flutter/material.dart';
import 'package:grain/utilities/colors.dart';
import 'package:iconly/iconly.dart';

input(ctx, {String hint = "", int x = 1}) => TextField(
      controller: ctx,
      maxLines: x,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: appColor.withOpacity(0.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 5),
          hintText: hint,
          hintStyle: TextStyle(color: lightGrey, fontSize: 12)),
    );

TextField textField(hint, ctl, {TextInputType keyboard = TextInputType.text}) =>
    TextField(
      decoration: InputDecoration(
          hintStyle: TextStyle(color: hintTextColor, fontSize: 12),
          contentPadding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            gapPadding: 16,
            borderSide: BorderSide(color: lightGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            gapPadding: 16,
            borderSide: BorderSide(color: lightGrey),
          ),
          hintText: hint),
      keyboardType: keyboard,
      controller: ctl,
    );

TextField passwordField(hint, bool obscure, ctl, Function onClick) => TextField(
      decoration: InputDecoration(
          hintStyle: TextStyle(color: hintTextColor, fontSize: 12),
          contentPadding:
              const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            gapPadding: 16,
            borderSide: BorderSide(color: lightGrey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            gapPadding: 16,
            borderSide: BorderSide(color: lightGrey),
          ),
          hintText: hint,
          suffixIcon: IconButton(
            onPressed: () => onClick(),
            icon: const Icon(Icons.visibility),
          ),
          suffixIconColor: lightDark),
      obscureText: obscure,
      obscuringCharacter: "*",
      controller: ctl,
    );

TextField dateField(hint, ctl, Function onClick) => TextField(
      decoration: InputDecoration(
        hintStyle: TextStyle(color: hintTextColor, fontSize: 12),
        contentPadding:
            const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          gapPadding: 16,
          borderSide: BorderSide(color: lightGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          gapPadding: 16,
          borderSide: BorderSide(color: lightGrey),
        ),
        hintText: hint,
      ),
      readOnly: true,
      onTap: () => onClick(),
      controller: ctl,
    );

TextField searchField(hint, {TextInputType keyboard = TextInputType.text}) =>
    TextField(
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            IconlyLight.search,
            color: lightgrey,
            size: 20,
          ),
        ),
        fillColor: light,
        filled: true,
        hintStyle: TextStyle(color: hintTextColor, fontSize: 10),
        contentPadding: const EdgeInsets.all(5),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          gapPadding: 10,
          borderSide: BorderSide(color: bgGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          gapPadding: 10,
          borderSide: BorderSide(color: bgGrey),
        ),
        hintText: hint,
      ),
      keyboardType: keyboard,
    );
