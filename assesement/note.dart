class Note {
  int? id;
  String title;
  String content;
  String createdAt;
  String updatedAt;
  String? imagePath;
  String? audioPath;
  String? drawingPath;  // Added field for drawing data

  Note({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.imagePath,
    this.audioPath,
    this.drawingPath,
  });
}
