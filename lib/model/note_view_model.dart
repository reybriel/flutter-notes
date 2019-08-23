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
}