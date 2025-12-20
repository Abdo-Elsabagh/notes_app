import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/notes/color_list_view.dart';
import 'package:notes_app/views/widgets/notes/custom_button.dart';
import 'package:notes_app/views/widgets/notes/custom_text_filed.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextFiled(
            onSaved: (value) => title = value,
            hinttext: 'Enter your note title',
            labeText: 'Title',
            prefixIco: const Icon(Icons.title),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 16),
          CustomTextFiled(
            onSaved: (value) {
              subtitle = value;
            },
            maxLines: 5,
            hinttext: 'Enter your note description',
            labeText: 'Description',
            prefixIco: const Icon(Icons.description),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 16),
          ColorsListView(),
          const SizedBox(height: 16),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTop: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDate =
                        DateFormat('dd/MM/yyyy  hh:mm a').format(currentDate);
                    var noteModel = NoteModel(
                      color: Colors.yellow.value,
                      title: title!,
                      subtitle: subtitle!,
                      date: formattedCurrentDate,
                    );

                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    setState(() {});
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                textButton: 'Add Note',
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
