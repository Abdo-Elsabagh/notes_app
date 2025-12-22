import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/empty_notes_view.dart';
import 'package:notes_app/views/widgets/notes/add_note_bottom_sheet.dart';
import 'package:notes_app/views/widgets/notes_view_bady.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  bool _showEmpty = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        setState(() {
          _showEmpty = true;
        });
      }
    });
  }

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
        body: BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
          final notes = context.read<NotesCubit>().notes;

          if (notes!.isNotEmpty) {
            return const NotesViewBady();
          }
          if (!_showEmpty) {
            return const NotesViewBady();
          }

          return const EmptyNotesView();
        }));
  }
}
