import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controler;
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.obscureText,
      required this.controler});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: TextField(
          controller: controler,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  BorderSide.none, // Remove outline for the shadow effect
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.inversePrimary,
                width: 2,
              ),
            ),
            fillColor: Theme.of(context).colorScheme.tertiary,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[350]),
          ),
          cursorColor: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
