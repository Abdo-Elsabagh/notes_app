import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constanst.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  bool isLoading = false;
  addNote(NoteModel note) async {
    isLoading = true;
    await (AddNoteLoading);
    try {
      var noteBox = Hive.box<NoteModel>(KNotesBox);
      await noteBox.add(note);
      isLoading = false;
      emit(AddNoteSuccess());
    } catch (e) {
      isLoading = false;
      emit(AddNoteFailuer(e.toString()));
    }
  }
}
