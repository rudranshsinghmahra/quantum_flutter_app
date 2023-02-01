import 'package:flutter/material.dart';

Widget customTextField(
    {required String labelText,
    required TextEditingController controller,
    required String hintText,
    required Icon suffixIcon}) {
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
