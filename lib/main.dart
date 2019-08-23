import 'package:flutter/material.dart';
import 'scenes/notes_list/notes_list_page.dart';

void main() => runApp(MyNotes());

class MyNotes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
      home: NotesListPage(),
      color: Colors.black,
    );
  }
}