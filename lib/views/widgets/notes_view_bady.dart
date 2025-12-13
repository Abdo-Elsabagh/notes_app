import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/notes_list_view.dart';

class NotesViewBady extends StatefulWidget {
  const NotesViewBady({super.key});

  @override
  State<NotesViewBady> createState() => _NotesViewBadyState();
}

class _NotesViewBadyState extends State<NotesViewBady> {
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

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
