import 'package:flutter/material.dart';

class BoxShowBody extends StatelessWidget {
  const BoxShowBody(
      {super.key,
      required this.massage,
      required this.text,
      required this.onPressed,
      required this.icon});
  final String massage;
  final String text;
  final Icon icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(height: 16),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            massage,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text("OK", style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
