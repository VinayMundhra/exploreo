import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String labelText;
  final String hintText;
  final TextInputType textInputType;
  String? Function(String?)? validator;
   TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false,
    required this.labelText,
    required this.hintText,
    required this.textInputType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1));

    return TextFormField(
      style: TextStyle(color: Colors.black),
      validator: validator,
      controller: textEditingController,
      decoration: InputDecoration(
        // labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
