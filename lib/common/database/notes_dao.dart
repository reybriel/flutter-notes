import 'package:my_notes/common/database/db_manager.dart';
import 'package:my_notes/model/note.dart';

Future<void> insert(Note note) async {
  await DatabaseManager().insert(note, 'Notes');
}

Future<List<Note>> retrieveAll() async {
  final maps = await DatabaseManager().retrieveAll('Notes');
  return List.generate(maps.length, (index) {
    return Note.fromMap(maps[index]);
  });
}