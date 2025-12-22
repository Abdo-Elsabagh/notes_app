import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';

class EmptyNotesView extends StatelessWidget {
  const EmptyNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CutomeAppBar(
            title: 'Notes',
            icon: Icons.search_rounded,
          ),
          Spacer(),
          Icon(
            Icons.note_add,
            size: 80,
            color: Colors.white,
          ),
          const SizedBox(height: 16),
          const Text(
            'No notes yet ✍️',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Create your first note to get started',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
