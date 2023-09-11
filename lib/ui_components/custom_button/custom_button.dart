import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color backgroundColor;

  const CustomAppButton({
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.backgroundColor,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16.0,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                26.0,
              ),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          ),
        ),
        onPressed: onPressed,
      );
}
