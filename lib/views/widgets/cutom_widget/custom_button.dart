import 'package:flutter/material.dart';
import 'package:notes_app/constanst.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTop,
      this.textButton,
      this.isLoading = false});
  final VoidCallback? onTop;
  final String? textButton;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTop,
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColors,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        minimumSize: Size(MediaQuery.of(context).size.width, 50),
      ),
      child: isLoading
          ? SizedBox(
              height: 26,
              width: 26,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Text(
              textButton!,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
    );
  }
}
