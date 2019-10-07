import 'dart:async';
import 'package:my_notes/model/note_view_model.dart';

class NotesListViewModel {
  StreamController<String> _titleStreamController;
  StreamController<List<NoteViewModel>> _notesStreamController;

  Sink<String> get _titleSink => _titleStreamController.sink;
  Sink<List<NoteViewModel>> get _notesSink => _notesStreamController.sink;

  Stream<String> get title => _titleStreamController.stream;
  Stream<List<NoteViewModel>> get notesList => _notesStreamController.stream;

  initialize() {
    _titleStreamController = StreamController();
    _notesStreamController = StreamController();
    _titleSink.add("Notes");
    _notesSink.add(NoteViewModel.mock());
  }

  dispose() {
    _titleStreamController.close();
    _notesStreamController.close();
  }

  onTapPlusButton() {
    print("On tap plus button");
  }

  onTapListItemAt(int index) {
    print("On tap list item at index $index");
  }
}