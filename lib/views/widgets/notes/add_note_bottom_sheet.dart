import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/notes_view.dart';
import 'package:notes_app/views/widgets/box_show_body.dart';
import 'package:notes_app/views/widgets/notes/add_note_form%20.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child:
          BlocConsumer<AddNoteCubit, AddNoteState>(listener: (context, state) {
        if (state is AddNoteFailuer) {
          print(state.errMessage);
          showDialog(
              context: context,
              builder: (context) => BoxShowBody(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    massage:
                        'Failed ${state.errMessage}, please try again later. ',
                    text: 'Failed to add ❌',
                    icon: Icon(Icons.error, color: Colors.red, size: 60),
                  ));
        }
        if (state is AddNoteSuccess) {
          showDialog(
              context: context,
              builder: (context) => BoxShowBody(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NotesView()));
                       BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    },
                    massage:
                        'The item has been added successfully to your notes. ',
                    text: 'Added Successful ✔️',
                    icon:
                        Icon(Icons.check_circle, color: Colors.green, size: 60),
                  ));
        }
      }, builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(
              child: AddNoteForm(),
            ),
          ),
        );
      }),
    );
  }
}
