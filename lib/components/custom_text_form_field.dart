import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final IconData? prefix;
  final bool isPassword;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Color? prefixIconColor;
  final bool isEnabled; // New parameter to enable/disable the text field

  const CustomTextFormField(
      {super.key,
      this.controller,
      this.hintText,
      this.isPassword = false,
      this.label,
      this.onChanged,
      this.prefix,
      this.validator,
      this.suffixIcon,
      this.prefixIconColor,
      this.isEnabled = true}); // Default is enabled

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: validator,
        onChanged: onChanged,
        enabled: isEnabled, // Set the enabled property based on isEnabled
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade700),
            borderRadius: BorderRadius.circular(2),
          ),
          prefixIcon: prefix != null ? Icon(prefix) : null,
          suffixIcon: suffixIcon,
          prefixIconColor: prefixIconColor,
          suffixIconColor: Colors.grey,
          hintText: hintText,
          labelText: label,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
