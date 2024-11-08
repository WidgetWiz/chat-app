import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Material(
        color: Theme.of(context).colorScheme.secondary, // Use secondary color
        borderRadius: BorderRadius.circular(12), // Rounded corners
        elevation: 4, // Shadow effect
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12), // Match the border radius
          splashColor: Theme.of(context)
              .colorScheme
              .inversePrimary
              .withOpacity(0.2), // Ripple effect
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: 15), // Adjust padding for button size
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white, // White text color for contrast
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
