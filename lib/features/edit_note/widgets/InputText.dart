import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget InputText(String label, TextInputType type,
    TextEditingController controller, String prefix,int length) {
  return Container(
      child: TextField(
        maxLength: length,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          counterText: "",
            labelText: label,
            prefixText: prefix,
            ),
      ));
}
