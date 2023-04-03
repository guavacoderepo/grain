import 'package:flutter/material.dart';
import 'package:grain/utilities/colors.dart';

input(ctx,{String hint = ""}) => TextField(
  controller: ctx,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: deepGreen.withOpacity(0.5),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            left: 20,
          ),
          hintText: hint),
    );
