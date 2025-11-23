import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/notes/custom_button.dart';
import 'package:notes_app/views/widgets/notes/custom_text_filed.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CustomTextFiled(
              hinttext: 'Enter your note title',
              labeText: 'Title',
              prefixIco: const Icon(Icons.title),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomTextFiled(
              maxLines: 5,
              hinttext: 'Enter your note description',
              labeText: 'Description',
              prefixIco: const Icon(Icons.description),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 32),
            CustomButton(
              onTop: () {},
              textButton: 'Add Note',
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
