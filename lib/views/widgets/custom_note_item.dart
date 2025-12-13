import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/edit_note_view.dart';
import 'package:notes_app/models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const EditNoteView();
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24.0, bottom: 24.0, left: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              title: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  note.title,
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.black,
                  ),
                ),
              ),
              subtitle: Text(
                note.subtitle,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black.withOpacity(.5),
                ),
              ),
              trailing: IconButton(
                onPressed: null,
                icon: () {
                  return const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 24,
                  );
                }(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, top: 16),
              child: Text(note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  )),
            ),

            // حل اخر لو حبيت تستخدم ال Row بدل ListTile

            // const Row(
            //   children: [
            //     Text(
            //       'Flutter tips',
            //       style: TextStyle(fontSize: 24.0, color: Colors.black),
            //     ),
            //     Spacer(),
            //     IconButton(
            //       onPressed: null,
            //       icon: Icon(
            //         Icons.delete,
            //         color: Colors.black,
            //         size: 40,
            //       ),
            //     )
            //   ],
            // ),
            // Text(
            //   'Build your creater with Tharwat samy',
            //   style: TextStyle(
            //       fontSize: 24.0, color: Colors.black.withOpacity(0.5)),
            // ),
            // Align(
            //     alignment: Alignment.centerRight,
            //     child: Text('May 21,2022',
            //         style: TextStyle(color: Colors.black.withOpacity(0.5)))),
          ],
        ),
      ),
    );
  }
}
