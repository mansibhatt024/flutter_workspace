import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:project/signature%20pad.dart';

import 'note.dart';
import 'database notebook.dart';

class HomePage extends StatelessWidget {
  final NotebookDatabase _dbManager = NotebookDatabase();
  String? selectedImagePath;
  String? selectedAudioPath;
  var _controller = SignaturePadController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Notebook'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: NotebookDatabase.getAllNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No notes available.'),
            );
          } else {
            List<Map<String, dynamic>> notes = snapshot.data!;
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index]['title'] ?? ''),
                  leading: notes[index]['imagePath'] != null
                      ? Image.file(File(notes[index]['imagePath']))
                      : null,
                  trailing: notes[index]['audioPath'] != null
                      ? Icon(Icons.volume_up)
                      : null,
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNoteDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showNoteDialog(BuildContext context, {Note? existingNote}) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();

    if (existingNote != null) {
      titleController.text = existingNote.title;
      contentController.text = existingNote.content;
    }

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(existingNote != null ? 'Edit Note' : 'Add a Note'),
          content: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(labelText: 'Content'),
              ),
              ElevatedButton(
                onPressed: () async {
                  XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    selectedImagePath = image.path;
                  }
                },
                child: Text('Select Image'),
              ),
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? audio = await FilePicker.platform.pickFiles(type: FileType.audio);
                  if (audio != null) {
                    selectedAudioPath = audio.files.single.path;
                  }
                },
                child: Text('Select Audio'),
              ),
              SizedBox(height: 10),
              SignaturePadWidget (
                controller: _controller,
                height: 200,
                backgroundColor: Colors.white,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  if (_controller != null) {
                    Uint8List? signatureBytes = await _controller.toPngBytes();
                    // TODO: Save or process the signatureBytes as needed
                  }

                  if (existingNote != null) {
                    // Update existing note
                    await NotebookDatabase.updateNote(Note(
                      id: existingNote.id,
                      title: titleController.text,
                      content: contentController.text,
                      imagePath: selectedImagePath,
                      audioPath: selectedAudioPath,
                      createdAt: existingNote.createdAt,
                      updatedAt: DateTime.now().toString(),
                    ));
                  } else {
                    // Save new note
                    await _saveNoteAndRefreshList(
                      titleController.text,
                      contentController.text,
                      context,
                    );
                  }

                  Navigator.of(context).pop(); // Close the dialog
                } catch (e) {
                  print('Error saving note: $e');
                  // Display error message to the user
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to save note. Please try again.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _saveNoteAndRefreshList(String title, String content, BuildContext context) async {
    Note newNote = Note(
      title: title,
      content: content,
      imagePath: selectedImagePath,
      audioPath: selectedAudioPath,
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );

    await NotebookDatabase.saveNote(newNote);
    _refreshList(context);
  }

  void _refreshList(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
