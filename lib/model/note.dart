import 'package:my_notes/common/abstract/mappable.dart';

class Note implements Mappable {
  final int id;
  final String title;
  final String content;
  final DateTime dateCreated;
  final DateTime dateUpdated;

  Note(this.id, this.title, this.content, this.dateCreated, this.dateUpdated);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'dateCreated': dateCreated,
      'dateUpdated': dateUpdated
    };
  }

  static Note fromMap(Map<String, dynamic> noteMap) {
    return Note(
      noteMap['id'],
      noteMap['title'], 
      noteMap['content'],
      noteMap['dateCreated'], 
      noteMap['dateUpdated']);
  }
 }
