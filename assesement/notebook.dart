// notebook.dart

import 'dart:io';

class Notebook {
  String noteType = '';
  String content = '';

  void generateNote() {
    var note = {'type': noteType, 'content': content};
    var file = File('notes.txt');
    file.writeAsStringSync('$note\n', mode: FileMode.append);
    _logTransaction('Note generated: $note');
  }

  String viewNotes() {
    var file = File('notes.txt');
    if (file.existsSync()) {
      return file.readAsStringSync();
    } else {
      return 'No notes available.';
    }
  }

  void _logTransaction(String entry) {
    var logFile = File('log.txt');
    logFile.writeAsStringSync('$entry\n', mode: FileMode.append);
  }
}
