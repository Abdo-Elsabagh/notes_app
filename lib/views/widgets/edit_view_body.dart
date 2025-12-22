import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/widgets/box_show_body.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/notes/color_list_view.dart';
import 'package:notes_app/views/widgets/notes/custom_text_filed.dart';

class EditNoteViewbady extends StatefulWidget {
  const EditNoteViewbady({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewbady> createState() => _EditNoteViewbadyState();
}

class _EditNoteViewbadyState extends State<EditNoteViewbady> {
  String? title, cotent;

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
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => BoxShowBody(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NotesView()),
                            );
                            widget.note.title = title ?? widget.note.title;
                            widget.note.subtitle =
                                cotent ?? widget.note.subtitle;

                            widget.note.save();
                            BlocProvider.of<NotesCubit>(context)
                                .fetchAllNotes();
                          },
                          massage: 'Your changes were applied successfully',
                          text: 'Update Successful ✔️',
                          icon: Icon(Icons.check_circle,
                              color: Colors.green, size: 60),
                        ));
              },
            ),
            const SizedBox(
              height: 32,
            ),
            CustomTextFiled(
              onChanged: (value) => title = value,
              hinttext: widget.note.title,
              prefixIco: const Icon(Icons.title),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            CustomTextFiled(
              onChanged: (value) {
                cotent = value;
              },
              maxLines: 5,
              hinttext: widget.note.subtitle,
              prefixIco: const Icon(Icons.description),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 32),
            ColorsListView()
          ],
        ),
      ),
    );
  }
}
