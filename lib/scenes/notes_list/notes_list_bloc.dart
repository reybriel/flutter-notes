import 'dart:async';
import 'dart:collection';
import 'package:my_notes/model/note_view_model.dart';

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
    await Future.delayed(Duration(seconds: 2), () {
      _viewStateController.add(NoteListViewState.empty);
    });
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
  static final mock = NoteListViewState(false, false, UnmodifiableListView(NoteViewModel.mock()));
}