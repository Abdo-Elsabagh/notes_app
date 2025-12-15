import 'package:flutter/material.dart';

class CheckDeletNote extends StatelessWidget {
  const CheckDeletNote({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Note"),
      content: const Text('Are you sure you want to delete this note?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
