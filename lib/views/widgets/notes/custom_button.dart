import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.onTop, this.textButton});
  VoidCallback? onTop;
  String? textButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTop,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlueAccent,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        textButton!,
        style: const TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}
