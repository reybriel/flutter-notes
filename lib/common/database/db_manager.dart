import 'package:my_notes/common/database/db_creator.dart' as DatabaseCreator;
import 'package:my_notes/common/abstract/mappable.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static DatabaseManager _shared;
  final Future<Database> database;

  factory DatabaseManager() {
    _shared ??= DatabaseManager._internalConstructor(DatabaseCreator.create());
    return _shared;
  }

  DatabaseManager._internalConstructor(this.database);

  Future<void> insert(Mappable entity, String intoTable) async {
    final database = await this.database;
    await database.insert(intoTable, entity.toMap());
  }

  Future<List<Map<String, dynamic>>> retrieveAll(String fromTable) async {
    final database = await this.database;
    return await database.query(fromTable);
  }
}
