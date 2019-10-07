import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> create() async {
  return openDatabase(join(await getDatabasesPath(), 'notes_database.db'),
      onCreate: (database, version) {
    return database.execute(
        'CREATE TABLE Notes(id INTEGER PRIMARY KEY, title TEXT, content TEXT, dateCreated DATE, dateUpdated DATE)');
  }, version: 1);
}
