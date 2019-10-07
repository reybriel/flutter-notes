import 'package:my_notes/model/note.dart';

class NoteViewModel {
  final String title;
  final String content;
  
  NoteViewModel(this.title, this.content);

  static List<NoteViewModel> mock() {
    return [
      NoteViewModel('Chocolate cake', 'recipy'),
      NoteViewModel('Shopping list', 'content')
    ];
  }

  static List<NoteViewModel> fromNotes(List<Note> notes) {
    return notes.map(fromNote);
  }

  static NoteViewModel fromNote(Note note) {
    return NoteViewModel(note.title, note.content);
  }
}