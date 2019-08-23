import 'package:flutter/material.dart';

class NotesListPage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => _NotesListState('Notes');
}

class _NotesListState extends State<NotesListPage> {
  final String _pageTitle;
  int _count = 0;

  _NotesListState(String pageTitle): this._pageTitle = pageTitle;

  void _addNewNote() => setState(() {
      _count++;
    });

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addNewNote(),
          )
        ],
      ),
      body: Center(
        child: Text('Hello, Note # $_count!'),
      ),
    );
}