import 'dart:async';
import 'package:rxdart/subjects.dart';
import 'package:my_notes/model/note_view_model.dart';
import 'package:my_notes/scenes/notes_list/notes_list_view_state.dart';
import 'package:my_notes/common/database/notes_dao.dart' as NotesDAO;

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