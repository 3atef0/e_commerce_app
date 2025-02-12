import 'package:ecommerce_app/components/custom_text_button.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textButton,
  });
  final String text;
  final void Function()? onPressed;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        CustomTextButton(
          text: textButton,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
