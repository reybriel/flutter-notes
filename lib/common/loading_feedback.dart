import 'package:flutter/material.dart';

mixin LoadingFeedback {
  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}