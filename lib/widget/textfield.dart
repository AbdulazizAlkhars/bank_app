import 'package:flutter/material.dart';

class myTextField {
  TextEditingController controller;
  IconData icon;
  String hintText;
  var onpress;
  myTextField(
      {required this.controller,
      required this.icon,
      required this.hintText,
      required this.onpress});
}

Widget textField(myTextField textfield) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: textfield.controller,
      // style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
        suffixIcon: IconButton(
            icon: Icon(textfield.icon),
            onPressed: () {
              textfield.onpress;
            }),
        hintText: textfield.hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
              width: 1, color: Color.fromRGBO(236, 229, 199, 10)),
        ),
      ),
    ),
  );
}
