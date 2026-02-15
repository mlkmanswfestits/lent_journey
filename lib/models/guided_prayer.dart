class GuidedPrayer {
  final String id;
  final String title;
  final String description;
  final String icon;
  final List<PrayerSection> sections;
  final int averageMinutes;

  const GuidedPrayer({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.sections,
    required this.averageMinutes,
  });
}

class PrayerSection {
  final String title;
  final String text;
  final String? instructions;
  final String? audioUrl;
  final String? imagePath;

  const PrayerSection({
    required this.title,
    required this.text,
    this.instructions,
    this.audioUrl,
    this.imagePath,
  });
}
