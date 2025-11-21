import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/notes/add_note_bottom_sheet.dart';
import 'package:notes_app/views/widgets/notes_view_bady.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            context: context,
            builder: (context) {
              return const AddNoteBottomSheet();
            },
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        //  shape: const CircleBorder(eccentricity: BorderSide.strokeAlignCenter),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.black,
          size: 26,
        ),
      ),
      body: const NotesViewBady(),
    );
  }
}
