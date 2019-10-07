import 'package:flutter/material.dart';

mixin EmptyListFeedback {
  Widget buildEmptyList() {
    return Center(
      child: Text(
        "This list is empty!", 
        style: TextStyle(fontSize: 30)
        ),
    );
  }
}