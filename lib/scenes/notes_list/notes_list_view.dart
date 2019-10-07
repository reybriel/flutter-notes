import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_notes/common/empty_list_feedback.dart';
import 'package:my_notes/common/loading_feedback.dart';
import 'package:my_notes/model/note_view_model.dart';
import 'package:my_notes/scenes/notes_list/notes_list_bloc.dart';

class NotesListView extends StatefulWidget {
  final NotesListBloc bloc = NotesListBloc();

  @override
  State<StatefulWidget> createState() => _NotesListState();
}

class _NotesListState extends State<NotesListView> with LoadingFeedback, EmptyListFeedback {

  @override
  void initState() {
    super.initState();
    widget.bloc.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => widget.bloc.onTapPlusButton(),
          )
        ],
      ),
      body: StreamBuilder(
        stream: widget.bloc.viewState,
        builder: (BuildContext context, AsyncSnapshot<NoteListViewState> snapshot) {
          if (snapshot.data.isLoading) {
            return buildLoading();
          } else if (snapshot.data.isEmpty) {
            return buildEmptyList();
          } else {
            return _buildNotesList(snapshot.data.notes);
          }
        })
    );
  }

  Widget _buildNotesList(UnmodifiableListView<NoteViewModel> notes) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        final note = notes[index];
        return ListTile(
          title: Text(note.title),
          subtitle: Text(note.content),
          onTap: () => widget.bloc.onTapListItemAt(index),
        );
      });
  }

  @override
  void dispose() {
    super.dispose();
    widget.bloc.dispose();
  }
}

