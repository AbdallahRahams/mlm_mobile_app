import 'package:flutter/material.dart';

Widget _buildTextField({
  required String labelText,
  required String hintText,
  required TextEditingController controller,
  bool isPassword = false,
}) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      border: OutlineInputBorder(),
    ),
  );
}
