import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';

class NotesViewBady extends StatelessWidget {
  const NotesViewBady({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Center(
                child: CutomeAppBar(),
              ),
              SizedBox(
                height: 32,
              ),
              NoteItem()
            ],
          ),
        ),
      ),
    );
  }
}

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              title: const Text(
                'Flutter tips',
                style: TextStyle(fontSize: 24.0, color: Colors.black),
              ),
              subtitle: Text(
                'Build your creater with Tharwat samy',
                style: TextStyle(
                    fontSize: 18.0, color: Colors.black.withOpacity(.5)),
              ),
              trailing: const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
            Text('May 21,2022',
                style: TextStyle(color: Colors.black.withOpacity(0.5)))
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
