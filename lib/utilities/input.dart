import 'package:flutter/material.dart';
import 'package:grain/utilities/colors.dart';
import 'package:iconly/iconly.dart';

input(ctx, {String hint = "", int x = 1}) => TextField(
      controller: ctx,
      maxLines: x,
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
          contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 5),
          hintText: hint),
    );

TextField textField(hint, {TextInputType keyboard = TextInputType.text}) =>
    TextField(
      decoration: InputDecoration(
          hintStyle: TextStyle(color: hintTextColor),
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
    );

TextField passwordField(hint, bool obscure, Function onClick) => TextField(
      decoration: InputDecoration(
          hintStyle: TextStyle(color: hintTextColor),
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
    );

// pinCode(context, pinctx) => PinCodeTextField(
//       appContext: context,
//       controller: pinctx,
//       length: 4,
//       cursorHeight: 71,
//       enableActiveFill: true,
//       textStyle: const TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w600,
//       ),
//       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//       pinTheme: PinTheme(
//         shape: PinCodeFieldShape.box,
//         borderRadius: BorderRadius.circular(4),
//         borderWidth: 1,
//         fieldWidth: 71,
//         fieldHeight: 71,
//         activeColor: lightGrey,
//         inactiveColor: lightGrey,
//         selectedColor: lightGrey,
//         selectedFillColor: transparent,
//         activeFillColor: transparent,
//         inactiveFillColor: transparent,
//       ),
//       onChanged: (v) {},
//     );

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

