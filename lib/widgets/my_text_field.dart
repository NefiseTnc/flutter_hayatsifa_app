import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  const MyTextField({Key? key,required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      border: const OutlineInputBorder(),
      suffixIcon: const Icon(Icons.add),
    ),
  );
  }
}

