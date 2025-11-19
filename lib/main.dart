import 'package:flutter/material.dart';
import 'package:notes_app/screen/home_screen.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 24,
            ),
            iconTheme: IconThemeData(size: 28)),
      ),
      home: const HomeScreen(),
    );
  }
}
