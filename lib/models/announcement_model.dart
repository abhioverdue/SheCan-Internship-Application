class AnnouncementModel {
  final String title;
  final String content;
  final DateTime date;
  final String category;
  final bool isImportant;

  AnnouncementModel({
    required this.title,
    required this.content,
    required this.date,
    required this.category,
    this.isImportant = false,
  });
}