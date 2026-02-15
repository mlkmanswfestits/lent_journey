import 'package:lent_journey_catholic/l10n/app_localizations.dart';
import '../models/lenten_recipe.dart';

class DailyDetail {
  final int day;
  final String date;
  final String theme;
  final String scriptureReading;
  final String reflection;
  final String prayer;
  final FastingType fastingType;
  final String fastingDescription;

  const DailyDetail({
    required this.day,
    required this.date,
    required this.theme,
    required this.scriptureReading,
    required this.reflection,
    required this.prayer,
    required this.fastingType,
    required this.fastingDescription,
  });
}

class DailyData {
  static DailyDetail getDayDetail(int day, AppLocalizations loc) {
    // Generate data based on Catholic Lenten calendar
    String theme = _getTheme(day, loc);
    String reading = _getReading(day, loc);
    String reflection = _getReflection(day, loc);
    String prayer = _getPrayer(day, loc);
    FastingType type = _getFastingType(day);
    String fastDesc = _getFastingDescription(type, loc);

    return DailyDetail(
      day: day,
      date: _getDateString(day),
      theme: theme,
      scriptureReading: reading,
      reflection: reflection,
      prayer: prayer,
      fastingType: type,
      fastingDescription: fastDesc,
    );
  }

  static String _getTheme(int day, AppLocalizations loc) {
    if (day == 1) return loc.day1Theme;
    if (day == 3) return loc.themeFridayAfterAsh;
    if (day % 7 == 3) {
      if (day == 45) return loc.themeGoodFriday;
      return loc.themeFriday;
    }
    if (day % 7 == 5) {
      if (day == 5) return loc.themeFirstSunday;
      if (day == 12) return loc.themeSecondSunday;
      if (day == 19) return loc.themeThirdSunday;
      if (day == 26) return loc.themeFourthSunday;
      if (day == 33) return loc.themeFifthSunday;
      if (day == 40) return loc.themeHolyWeek;
      if (day == 47) return loc.themeEaster;
      return loc.themeSunday;
    }

    // Holy Week
    if (day == 44) return loc.themeHolyThursday;
    if (day == 46) return loc.themeHolySaturday;

    final themes = [
      loc.themeArray0, loc.themeArray1, loc.themeArray2, loc.themeArray3, loc.themeArray4,
      loc.themeArray5, loc.themeArray6, loc.themeArray7, loc.themeArray8, loc.themeArray9,
      loc.themeArray10, loc.themeArray11, loc.themeArray12, loc.themeArray13, loc.themeArray14,
      loc.themeArray15, loc.themeArray16, loc.themeArray17, loc.themeArray18, loc.themeArray19,
      loc.themeArray20, loc.themeArray21, loc.themeArray22, loc.themeArray23, loc.themeArray24,
      loc.themeArray25, loc.themeArray26, loc.themeArray27, loc.themeArray28, loc.themeArray29,
      loc.themeArray30, loc.themeArray31, loc.themeArray32, loc.themeArray33, loc.themeArray34,
      loc.themeArray35, loc.themeArray36, loc.themeArray37, loc.themeArray38, loc.themeArray39,
    ];

    return themes[day % themes.length];
  }

  static String _getReading(int day, AppLocalizations loc) {
    if (day == 1) return loc.day1Reading;
    
    final readings = [
      loc.readingArray0, loc.readingArray1, loc.readingArray2, loc.readingArray3, loc.readingArray4,
      loc.readingArray5, loc.readingArray6, loc.readingArray7, loc.readingArray8, loc.readingArray9,
      loc.readingArray10, loc.readingArray11, loc.readingArray12, loc.readingArray13, loc.readingArray14,
      loc.readingArray15, loc.readingArray16, loc.readingArray17, loc.readingArray18, loc.readingArray19,
      loc.readingArray20, loc.readingArray21, loc.readingArray22, loc.readingArray23, loc.readingArray24,
      loc.readingArray25, loc.readingArray26, loc.readingArray27, loc.readingArray28, loc.readingArray29,
      loc.readingArray30, loc.readingArray31, loc.readingArray32, loc.readingArray33, loc.readingArray34,
      loc.readingArray35, loc.readingArray36, loc.readingArray37, loc.readingArray38, loc.readingArray39,
    ];

    if (day == 47) return loc.scriptureMatthew28 + " - " + loc.scriptureMatthew28Text;
    if (day % 7 == 3) return loc.scriptureIsaiah58 + " - " + loc.scriptureIsaiah58Text;
    if (day % 7 == 5)
      return loc.readingSundayGeneric;

    final ref = readings[day % readings.length];
    return "$ref - ${loc.dailyInspirationSuffix}";
  }

  static String _getReflection(int day, AppLocalizations loc) {
    if (day == 1) return loc.reflectionAshWednesday;
    if (day == 1) return loc.reflectionAshWednesday; // Deduplicate check? The original code had redundant check.
    // Wait, the original code had:
    // if (day == 1) return loc.day1Reflection; 
    // if (day == 1) return "Today we receive..."
    // So distinct keys? No, I should use reflectionAshWednesday.
    
    if (day % 7 == 3) return loc.reflectionFridayGeneric;
    if (day % 7 == 5) return loc.reflectionSundayGeneric;
    if (day == 44) return loc.reflectionHolyThursday;
    if (day == 45) return loc.reflectionGoodFriday;
    if (day == 46) return loc.reflectionHolySaturday;
    if (day == 47) return loc.reflectionEaster;

    final reflections = [
      loc.reflectionArray0, loc.reflectionArray1, loc.reflectionArray2, loc.reflectionArray3, loc.reflectionArray4,
      loc.reflectionArray5, loc.reflectionArray6, loc.reflectionArray7, loc.reflectionArray8, loc.reflectionArray9,
      loc.reflectionArray10, loc.reflectionArray11, loc.reflectionArray12, loc.reflectionArray13, loc.reflectionArray14,
      loc.reflectionArray15, loc.reflectionArray16, loc.reflectionArray17, loc.reflectionArray18, loc.reflectionArray19,
      loc.reflectionArray20,
    ];

    return reflections[day % reflections.length];
  }

  static String _getPrayer(int day, AppLocalizations loc) {
    if (day == 1) return loc.prayerAshWednesday;
    if (day % 7 == 3) return loc.prayerFridayGeneric;
    if (day % 7 == 5) return loc.prayerSundayGeneric;
    if (day == 47) return loc.prayerEaster;
    if (day >= 40) return loc.prayerHolyWeek;

    final prayers = [
      loc.prayerArray0, loc.prayerArray1, loc.prayerArray2, loc.prayerArray3, loc.prayerArray4,
      loc.prayerArray5, loc.prayerArray6, loc.prayerArray7, loc.prayerArray8, loc.prayerArray9,
    ];

    return prayers[day % prayers.length];
  }

  static FastingType _getFastingType(int day) {
    if (day == 1 || day == 45)
      return FastingType.fullFast; // Ash Wed / Good Fri
    if (day == 47) return FastingType.none; // Easter
    if (day % 7 == 3) return FastingType.abstinence; // Other Fridays
    if (day % 7 == 5) return FastingType.none; // Sundays
    return FastingType.partialFast; // Other days
  }

  static String _getFastingDescription(FastingType type, AppLocalizations loc) {
    switch (type) {
      case FastingType.fullFast:
        return loc.fastingFullDesc;
      case FastingType.partialFast:
        return loc.fastingPartialDesc;
      case FastingType.abstinence:
        return loc.fastingAbstinenceDesc;
      case FastingType.none:
        return loc.fastingNoneDesc;
    }
  }

  static String _getDateString(int day) {
    final startDate = DateTime(2026, 2, 18); // Ash Wednesday 2026
    final date = startDate.add(Duration(days: day - 1));
    final months = [
      "",
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    final daySuffix = _getDaySuffix(date.day);
    return "${months[date.month]} ${date.day}$daySuffix, 2026";
  }

  static String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
