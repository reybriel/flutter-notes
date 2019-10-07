import 'dart:collection';
import 'package:my_notes/model/note_view_model.dart';

class NoteListViewState {
  final bool isEmpty;
  final bool isLoading;
  final UnmodifiableListView<NoteViewModel> notes;

  NoteListViewState(this.isEmpty, this.isLoading, this.notes);

  static final loading = NoteListViewState(false, true, UnmodifiableListView([]));
  static final empty = NoteListViewState(true, false, UnmodifiableListView([]));

  static NoteListViewState some(UnmodifiableListView<NoteViewModel> notes) {
    return NoteListViewState(false, false, notes);
  }
}