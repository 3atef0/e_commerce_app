import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
  });
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero), // No padding
          minimumSize: MaterialStateProperty.all(Size(0, 0)), // No extra size
          tapTargetSize:
              MaterialTapTargetSize.shrinkWrap, // Reduce clickable area
          overlayColor:
              MaterialStateProperty.all(Colors.transparent), // No hover effect
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.blue.shade400, fontWeight: FontWeight.bold),
        ));
  }
}
