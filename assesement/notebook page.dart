import 'package:flutter/material.dart';
import 'note.dart';

class NotePage extends StatelessWidget {
  final Note note;

  NotePage({required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(note.content),
      ),
    );
  }
}
