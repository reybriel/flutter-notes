import 'dart:async';
import 'dart:collection';
import 'package:my_notes/model/note_view_model.dart';
import 'package:my_notes/common/database/notes_dao.dart' as NotesDAO;

class NotesListBloc {
  StreamController<NoteListViewState> _viewStateController;
  Sink<NoteListViewState> get _viewStateSink => _viewStateController.sink;
  Stream<NoteListViewState> get viewState => _viewStateController.stream;

  initialize() {
    _viewStateController = StreamController();
    _viewStateSink.add(NoteListViewState.loading);
    _requestNotes();
  }

  _requestNotes() async {
    final notes = await NotesDAO.retrieveAll();
    if (notes.isEmpty) {
      _viewStateController.add(NoteListViewState.empty);
    } else {
      final viewModels = NoteViewModel.fromNotes(notes);
      _viewStateController.add(NoteListViewState.some(viewModels));
    }
  }

  dispose() {
    _viewStateController.close();
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