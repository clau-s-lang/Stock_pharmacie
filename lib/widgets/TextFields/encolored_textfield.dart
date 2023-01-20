import 'package:flutter/material.dart';

Padding encoloredTextField({
  controller,
  maxLines,
  String? label,
  String? hint,
  textType,
  int? textLimit,
  double? width,
  double? height,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Container(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Le champ ne peut pas etre vide';
          }
          return null;
        },
        maxLines: maxLines,
        maxLength: textLimit,
        keyboardType: textType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.green, style: BorderStyle.solid, width: 0.1),
          ),
        ),
        textCapitalization: TextCapitalization.sentences,
      ),
    ),
  );
}
