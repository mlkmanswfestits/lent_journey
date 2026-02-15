class LiturgyHour {
  final String name;
  final String significance;
  final String openingPrayer;
  final String shortReading;
  final String closingPrayer;

  const LiturgyHour({
    required this.name,
    required this.significance,
    required this.openingPrayer,
    required this.shortReading,
    required this.closingPrayer,
  });
}

class LiturgyHoursData {
  static List<LiturgyHour> getHoursForDay(int day) {
    return [
      const LiturgyHour(
        name: "Lauds (Morning Prayer)",
        significance: "Consecrates the morning to God.",
        openingPrayer:
            "Lord, open my lips. And my mouth shall proclaim your praise.",
        shortReading: "The night is far spent, the day is at hand...",
        closingPrayer:
            "May the Lord bless us, protect us from all evil and bring us to everlasting life.",
      ),
      const LiturgyHour(
        name: "Vespers (Evening Prayer)",
        significance: "Evening sacrifice of praise.",
        openingPrayer:
            "God, come to my assistance. Lord, make haste to help me.",
        shortReading:
            "Let your light shine before men, that they may see your good works...",
        closingPrayer:
            "May the souls of the faithful departed, through the mercy of God, rest in peace.",
      ),
      const LiturgyHour(
        name: "Compline (Night Prayer)",
        significance: "Prayer before sleep.",
        openingPrayer:
            "May the Lord almighty grant us a quiet night and a perfect end.",
        shortReading:
            "Be sober, be vigilant; because your adversary the devil walketh about...",
        closingPrayer: "Into your hands, O Lord, I commend my spirit.",
      ),
    ];
  }
}
