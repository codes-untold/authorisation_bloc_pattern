import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox(this.editingController, {super.key});

  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editingController,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field required';
        } else if (value!.length < 4) {
          return 'pin must be least 4 digits';
        } else {
          return null;
        }
      },
      onChanged: (value) {},
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 10, left: 10),
        hintText: 'Enter your pin',
        hintStyle: const TextStyle(color: Color(0XFF414E68), fontSize: 13),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            color: Color(0XFF414E68),
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
