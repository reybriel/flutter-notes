import 'package:flutter/material.dart';
import 'package:my_notes/model/note_view_model.dart';
import 'package:my_notes/scenes/notes_list/notes_list_view_model.dart';

class NotesListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotesListState();
}

class _NotesListState extends State<NotesListView> {
  NotesListViewModel _viewModel =  NotesListViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: _viewModel.title, 
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Text(snapshot.data);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _viewModel.onTapPlusButton(),
          )
        ],
      ),
      body: StreamBuilder(
        stream: _viewModel.notesList,
        builder: (BuildContext context, AsyncSnapshot<List<NoteViewModel>> snapshot) {
          final notes = snapshot.data;
          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              final note = notes[index];
              return ListTile(
                title: Text(note.title),
                subtitle: Text(note.content),
                onTap: () => _viewModel.onTapListItemAt(index),
              );
            });
        })
    );
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }
}

