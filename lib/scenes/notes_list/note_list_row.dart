import 'package:flutter/material.dart';
import 'package:my_notes/model/note_view_model.dart';

class NoteListRow extends StatelessWidget {
  final NoteViewModel _noteViewModel;
  
  NoteListRow(this._noteViewModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    _noteViewModel.title,
                    style: TextStyle(
                      color: Colors.lightGreen.withAlpha(150),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    _noteViewModel.content,
                    style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      );
  }
}