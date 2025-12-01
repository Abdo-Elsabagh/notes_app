import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      this.hinttext,
      this.labeText,
      this.prefixIco,
      this.suffixIcon,
      this.keyboardType,
      this.isVisible = false,
      this.maxLines = 1,
      this.onSaved});
  final String? labeText;
  final String? hinttext;
  final Icon? prefixIco;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final bool isVisible;
  final int maxLines;

  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        }

        return null;
      },
      maxLines: maxLines,
      onSaved: onSaved,
      keyboardType: keyboardType,
      obscureText: isVisible,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        prefixIcon: prefixIco,
        labelText: labeText,
        hintText: hinttext,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
