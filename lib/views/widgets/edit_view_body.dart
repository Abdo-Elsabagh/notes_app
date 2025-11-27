import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/box_show_body.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/notes/custom_text_filed.dart';

class EditNoteViewbady extends StatelessWidget {
  const EditNoteViewbady({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CutomeAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              ontap: () {
                showDialog(
                    context: context,
                    builder: (context) => const BoxShowBody(
                          massage: 'Your changes were applied successfully',
                          text: 'Update Successful 😊',
                          icon: Icon(Icons.check_circle,
                              color: Colors.green, size: 60),
                        ));
              },
            ),
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
              hinttext: 'Enter your note Content',
              labeText: 'Content',
              prefixIco: const Icon(Icons.description),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 32),
            Image.asset('assets/image/logo.png'),
          ],
        ),
      ),
    );
  }
}
