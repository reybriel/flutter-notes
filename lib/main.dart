import 'package:flutter/material.dart';
import 'package:my_notes/scenes/notes_list/notes_list_view.dart';

void main() => runApp(MyNotes());

class MyNotes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrange,
      ),
      home: NotesListView(),
    );
  }
}