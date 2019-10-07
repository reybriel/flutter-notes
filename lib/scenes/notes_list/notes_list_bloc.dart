import 'dart:async';
import 'dart:collection';
import 'package:my_notes/model/note_view_model.dart';
import 'package:my_notes/common/database/notes_dao.dart' as NotesDAO;
import 'package:rxdart/subjects.dart';

class NotesListBloc {
  final BehaviorSubject<NoteListViewState> _viewStateSubject = BehaviorSubject.seeded(NoteListViewState.loading);
  Stream<NoteListViewState> get viewState => _viewStateSubject.stream;

  initialize() {
    _requestNotes();
  }

  _requestNotes() async {
    final notes = await NotesDAO.retrieveAll();
    if (notes.isEmpty) {
      _viewStateSubject.add(NoteListViewState.empty);
    } else {
      final viewModels = NoteViewModel.fromNotes(notes);
      _viewStateSubject.add(NoteListViewState.some(viewModels));
    }
  }

  dispose() {
    _viewStateSubject.close();
  }

  onTapPlusButton() {
    print("On tap plus button");
  }

  onTapListItemAt(int index) {
    print("On tap list item at index $index");
  }
}

class NoteListViewState {
  bool isEmpty;
  bool isLoading;
  UnmodifiableListView<NoteViewModel> notes;

  NoteListViewState(this.isEmpty, this.isLoading, this.notes);

  static final loading = NoteListViewState(false, true, UnmodifiableListView([]));
  static final empty = NoteListViewState(true, false, UnmodifiableListView([]));

  static NoteListViewState some(UnmodifiableListView<NoteViewModel> notes) {
    return NoteListViewState(false, false, notes);
  }
}