import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/notes_list_view.dart';

class NotesViewBady extends StatelessWidget {
  const NotesViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: CutomeAppBar(
                title: 'Notes',
                icon: Icons.search_rounded,
              ),
            ),
            Expanded(child: NotesListView())
          ],
        ),
      ),
    );
  }
}
