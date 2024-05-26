import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;

  const InputWidget({
    super.key,
    required this.label,
    this.isPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 46.0, vertical: 8.0),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}
