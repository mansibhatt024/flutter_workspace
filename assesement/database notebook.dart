import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import 'note.dart';

class NotebookDatabase {
  static const String tableName = 'notes';

  static Future<void> createTable(sql.Database database) async {
    await database.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        content TEXT,
        imagePath TEXT,
        audioPath TEXT,
        drawingPath TEXT,
        createdAt TEXT NOT NULL,
        updatedAt TEXT NOT NULL
      )
    ''');
  }

  static Future<sql.Database> db() async {
    final dbPath = await sql.getDatabasesPath();
    final pathToDb = path.join(dbPath, 'notebook.db');

    return sql.openDatabase(pathToDb, version: 1, onCreate: (db, version) async {
      await createTable(db);
    });
  }

  static Future<int> saveNote(Note note) async {
    final db = await NotebookDatabase.db();
    final data = {
      'title': note.title,
      'content': note.content,
      'imagePath': note.imagePath,
      'audioPath': note.audioPath,
      'drawingPath': note.drawingPath,
      'createdAt': note.createdAt,
      'updatedAt': note.updatedAt,
    };
    final id = await db.insert(tableName, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createNote(String title, String content) async {
    final db = await NotebookDatabase.db();
    final data = {
      'title': title,
      'content': content,
      'createdAt': DateTime.now().toString(),
      'updatedAt': DateTime.now().toString(),
    };
    final id = await db.insert(tableName, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getAllNotes() async {
    final db = await NotebookDatabase.db();
    return db.query(tableName, orderBy: 'updatedAt DESC');
  }

  static Future<void> updateNote(Note note) async {
    final db = await NotebookDatabase.db();
    final data = {
      'title': note.title,
      'content': note.content,
      'imagePath': note.imagePath,
      'audioPath': note.audioPath,
      'drawingPath': note.drawingPath,
      'updatedAt': DateTime.now().toString(),
    };
    await db.update(tableName, data, where: 'id = ?', whereArgs: [note.id]);
  }

  static Future<void> deleteNote(int id) async {
    final db = await NotebookDatabase.db();
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}