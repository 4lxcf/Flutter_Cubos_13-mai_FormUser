import 'package:flutter/material.dart';

class TextFormPersonalized extends StatelessWidget {
  final String hintText;
  final String textToSave;

  TextFormPersonalized({
    @required this.hintText,
    @required this.textToSave,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      style: TextStyle(
        color: Colors.black54,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo é obrigatório!';
        } else {
          return null;
        }
      },
    );
  }
}
