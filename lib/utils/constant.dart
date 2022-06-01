import 'package:flutter/material.dart';

const kTextColor = Color(0xFF757575);

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: .15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: kTextColor),
  );
}
