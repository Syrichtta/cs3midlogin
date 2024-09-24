import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final String labelText;

  const TextInputWidget({
    super.key,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF707070),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color:
                  Color(0xFFE3E3E3)), // Set the color of the default underline
        ),
      ),
    );
  }
}
