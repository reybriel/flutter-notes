import 'package:flutter/material.dart';
import 'package:my_notes/scenes/notes_list/note_list_row.dart';
import 'package:my_notes/model/note_view_model.dart';

class NotesListPage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _NotesListState('Notes');
}

class _NotesListState extends State<NotesListPage> {
  final String _pageTitle;
  List<NoteViewModel> _notes = NoteViewModel.mock();

  _NotesListState(String pageTitle): this._pageTitle = pageTitle;

  void _addNewNote() => setState(() {
    });

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addNewNote,
          )
        ],
      ),
      body: ListView(
        children: _notes.map((noteViewModel) {
          return NoteListRow(noteViewModel);
        }).toList(),
      ),
    );
}