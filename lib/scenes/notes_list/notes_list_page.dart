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

  int get _listLength => _notes.length * 2;

  _NotesListState(this._pageTitle);

  void _addNewNote() => setState(() {
    });

  Widget _itemBuilder(BuildContext context, int i) {
    if (i.isOdd) return Divider();
    final index = i ~/ 2;
    return NoteListRow(_notes[index]); 
  }

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
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: _listLength,
        itemBuilder: _itemBuilder,
      ),
    );
}