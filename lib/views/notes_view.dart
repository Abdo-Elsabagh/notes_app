import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/empty_notes_view.dart';
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
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
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
        body: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
            final notes = context.read<NotesCubit>().notes;

            if (notes!.isEmpty) {
              return const EmptyNotesView();
            } else {
              return const NotesViewBady();
            }
          },
        ));
  }
}
