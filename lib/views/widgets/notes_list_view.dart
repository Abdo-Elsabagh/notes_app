import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/cutom_widget/custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1250),
            // transitionBuilder: (child, animation) {
            //   return FadeTransition(opacity: animation, child: child);
            // },
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                        .animate(animation),
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: ListView.separated(
              key: ValueKey(notes.length),
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return NoteItem(
                  key: ValueKey(notes[index].key),
                  note: notes[index],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
