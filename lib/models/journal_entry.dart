import 'package:hive/hive.dart';

part 'journal_entry.g.dart';

@HiveType(typeId: 5)
class JournalEntry {
  @HiveField(0)
  final int day;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final String content;

  @HiveField(3)
  final String? mood;

  const JournalEntry({
    required this.day,
    required this.date,
    required this.content,
    this.mood,
  });

  JournalEntry copyWith({
    int? day,
    DateTime? date,
    String? content,
    String? mood,
  }) {
    return JournalEntry(
      day: day ?? this.day,
      date: date ?? this.date,
      content: content ?? this.content,
      mood: mood ?? this.mood,
    );
  }
}
