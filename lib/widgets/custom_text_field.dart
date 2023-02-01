import 'package:flutter/material.dart';

Widget customTextField({
  required String labelText,
  required TextEditingController controller,
  required String hintText,
  required Icon suffixIcon,
  required String? Function(String?)? validator,
  required AutovalidateMode? autovalidateMode,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        labelText,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Row(
        children: [
          Expanded(
              child: TextFormField(
            autovalidateMode: autovalidateMode,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: suffixIcon,
            ),
          ))
        ],
      ),
    ],
  );
}
