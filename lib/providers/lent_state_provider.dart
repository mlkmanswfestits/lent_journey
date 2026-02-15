import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../services/bible_service.dart';
import '../services/notification_service.dart';
import '../models/daily_detail.dart';
import 'package:lent_journey_catholic/l10n/app_localizations.dart';

class LentStateProvider extends ChangeNotifier {
  final Box _box = Hive.box('lentJourney');
  Timer? _dateCheckTimer;

  LentStateProvider() {
    _loadNotificationSettings();
    _loadLocale();
    checkDateUpdate();
    // Check for date changes every 15 minutes while app is running
    _dateCheckTimer = Timer.periodic(const Duration(minutes: 15), (_) => checkDateUpdate());
  }

  // Localization
  Locale _currentLocale = const Locale('en');
  Locale get currentLocale => _currentLocale;

  void _loadLocale() {
    final code = _box.get('localeCode', defaultValue: 'en');
    _currentLocale = Locale(code);
  }

  void setLocale(Locale locale) {
    _currentLocale = locale;
    _box.put('localeCode', locale.languageCode);
    notifyListeners();
  }

  @override
  void dispose() {
    _dateCheckTimer?.cancel();
    super.dispose();
  }

  // Lent dates
  final DateTime lentStartDate = DateTime(2026, 2, 18); // Ash Wednesday 2026
  final DateTime easterDate = DateTime(2026, 4, 5); // Easter 2026

  // State variables
  // State variables
  int? _viewingDay;
  int? _lastKnownDay;

  int get currentDay {
    final today = DateTime.now();
    final diff = today.difference(lentStartDate).inDays;
    return (diff + 1).clamp(1, 47);
  }

  void checkDateUpdate() {
    final newDay = currentDay;
    if (_lastKnownDay != null && newDay != _lastKnownDay) {
      _viewingDay = null; // Reset to current day
      notifyListeners();
    }
    _lastKnownDay = newDay;
  }

  // The day currently being viewed/interacted with in the UI
  int get displayDay => _viewingDay ?? currentDay;

  void setViewingDay(int day) {
    _viewingDay = day;
    notifyListeners();
  }

  double get progress => currentDay / 47;

  int get prayerTime => _box.get('prayerTime', defaultValue: 0);
  int get prayerStreak => _box.get('prayerStreak', defaultValue: 0);

  bool get isFasting => _box.get('isFasting', defaultValue: false);
  int get fastingStreak => _box.get('fastingStreak', defaultValue: 0);
  String? get fastingStartTime => _box.get('fastingStartTime');
  String get fastType => _box.get('fastType', defaultValue: 'Partial Fast');

  void setFastType(String type) {
    _box.put('fastType', type);
    notifyListeners();
  }

  double get almsgivingAmount =>
      _box.get('almsgivingAmount', defaultValue: 0.0);
  double get almsgivingGoal => _box.get('almsgivingGoal', defaultValue: 100.0);
  int get almsgivingStreak => _box.get('almsgivingStreak', defaultValue: 0);
  double get totalDonated => _box.get('totalDonated', defaultValue: 0.0);
  int get mercyCount => _box.get('mercyCount', defaultValue: 0);

  List<String> get selectedSacrifices {
    final list = _box.get('selectedSacrifices', defaultValue: <String>[]);
    return List<String>.from(list);
  }

  void toggleSacrifice(String sacrifice) {
    final list = selectedSacrifices;
    if (list.contains(sacrifice)) {
      list.remove(sacrifice);
    } else {
      list.add(sacrifice);
    }
    _box.put('selectedSacrifices', list);
    notifyListeners();
  }

  // Sacrifice Success Logging
  Map<String, List<int>> get sacrificeLogs {
    final data = _box.get('sacrificeLogs', defaultValue: <String, dynamic>{});
    final Map<String, List<int>> logs = {};
    data.forEach((key, value) {
      logs[key] = List<int>.from(value);
    });
    return logs;
  }

  // Modified to accept optional day
  void logSacrificeSuccess(String sacrificeName, {int? day}) {
    final logs = sacrificeLogs;
    final targetDay = day ?? displayDay;

    if (!logs.containsKey(sacrificeName)) {
      logs[sacrificeName] = [targetDay];
    } else if (!logs[sacrificeName]!.contains(targetDay)) {
      logs[sacrificeName]!.add(targetDay);
    } else {
      // Toggle off if already logged today
      logs[sacrificeName]!.remove(targetDay);
    }

    _box.put('sacrificeLogs', logs);
    notifyListeners();
  }

  bool isSacrificeLogged(String sacrificeName, int day) {
    final logs = sacrificeLogs;
    return logs[sacrificeName]?.contains(day) ?? false;
  }

  int getSacrificeStreak(String sacrificeName) {
    final logs = sacrificeLogs[sacrificeName] ?? [];
    if (logs.isEmpty) return 0;

    int streak = 0;
    int day = currentDay;

    final sortedLogs = List<int>.from(logs)..sort((a, b) => b.compareTo(a));

    if (day > 1 && !sortedLogs.contains(day) && !sortedLogs.contains(day - 1)) {
      return 0;
    }

    int checkDay = sortedLogs.contains(day) ? day : day - 1;
    if (checkDay < 1) return 0;

    while (sortedLogs.contains(checkDay) && checkDay >= 1) {
      streak++;
      checkDay--;
    }

    return streak;
  }

  int getTotalSacrificeSuccesses(String sacrificeName) {
    return sacrificeLogs[sacrificeName]?.length ?? 0;
  }

  double get globalSacrificeSuccessRate {
    final selected = selectedSacrifices;
    if (selected.isEmpty || currentDay == 0) return 0.0;

    int totalPossible = selected.length * currentDay;
    int totalActual = 0;

    final logs = sacrificeLogs;
    for (final sacrifice in selected) {
      final count = logs[sacrifice]?.where((d) => d <= currentDay).length ?? 0;
      totalActual += count;
    }

    return totalActual / totalPossible;
  }

  List<Map<String, dynamic>> get mercyLogs {
    final logs = _box.get('mercyLogs', defaultValue: []);
    return (logs as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  BibleVersion get bibleVersion {
    final index =
        _box.get('bibleVersion', defaultValue: BibleVersion.rsvce.index);
    return BibleVersion.values[index];
  }

  void setBibleVersion(BibleVersion version) {
    _box.put('bibleVersion', version.index);
    notifyListeners();
  }

  void setAlmsgivingGoal(double goal) {
    _box.put('almsgivingGoal', goal);
    notifyListeners();
  }

  List<Map<String, dynamic>> get meals {
    final mealsData = _box.get('meals', defaultValue: []);
    return (mealsData as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  List<Map<String, dynamic>> getMealsForDay(int day) {
    final mealsList = meals;
    return mealsList.where((meal) {
      if (meal.containsKey('day')) {
        return meal['day'] == day;
      } else {
        // Fallback for old data without explicit day
        final time = DateTime.parse(meal['time']);
        final mealDay = time.difference(lentStartDate).inDays + 1;
        return mealDay == day;
      }
    }).toList();
  }

  // Prayer methods
  void addPrayerTime(int minutes) {
    final current = prayerTime;
    _box.put('prayerTime', current + minutes);
    notifyListeners();
  }

  void incrementPrayerStreak() {
    _box.put('prayerStreak', prayerStreak + 1);
    notifyListeners();
  }

  // Fasting methods
  void startFast() {
    _box.put('isFasting', true);
    _box.put('fastingStartTime', DateTime.now().toIso8601String());
    notifyListeners();
  }

  void endFast() {
    _box.put('isFasting', false);
    _box.put('fastingStartTime', null);
    _box.put('fastingStreak', fastingStreak + 1);
    notifyListeners();
  }

  Duration? get fastingDuration {
    if (!isFasting || fastingStartTime == null) return null;
    final start = DateTime.parse(fastingStartTime!);
    return DateTime.now().difference(start);
  }

  // Modified to accept optional day
  void logMeal(String description, String mealType, {int? day}) {
    final mealsList = meals;
    final targetDay = day ?? displayDay;
    
    // Calculate date for the target day
    final targetDate = lentStartDate.add(Duration(days: targetDay - 1));
    // Preserve current time component if logging for today, otherwise specific day mid-day
    final now = DateTime.now();
    final logTime = (targetDay == currentDay) 
        ? now 
        : DateTime(targetDate.year, targetDate.month, targetDate.day, 12, 0);

    mealsList.add({
      'description': description,
      'mealType': mealType,
      'time': logTime.toIso8601String(),
      'day': targetDay, // Explicitly store day index
      'fastType': fastType,
    });
    _box.put('meals', mealsList);
    notifyListeners();
  }

  bool isRecipeLoggedToday(String recipeName) {
    final mealsList = meals;
    final today = DateTime.now();
    return mealsList.any((meal) {
      final mealTime = DateTime.parse(meal['time'] as String);
      return meal['description'] == recipeName &&
          mealTime.year == today.year &&
          mealTime.month == today.month &&
          mealTime.day == today.day;
    });
  }

  // Helpers for Calendar Visualization
  Set<int> get daysWithMeals {
    final mealsList = meals;
    final Set<int> days = {};
    for (final meal in mealsList) {
      if (meal.containsKey('day')) {
        days.add(meal['day'] as int);
      } else {
        // Fallback for old data or data logged without explicit day
        final time = DateTime.parse(meal['time']);
        final day = time.difference(lentStartDate).inDays + 1;
        if (day >= 1 && day <= 47) days.add(day);
      }
    }
    return days;
  }

  Set<int> get daysWithSacrifices {
    final Set<int> days = {};
    final logs = sacrificeLogs;
    logs.values.forEach((dayList) => days.addAll(dayList));
    return days;
  }

  Set<int> get daysWithJournal {
    final entryKeys = journalEntries.keys.toList();
    return entryKeys.toSet();
  }

  // Almsgiving methods
  void recordDonation(double amount) {
    _box.put('almsgivingAmount', almsgivingAmount + amount);
    _box.put('totalDonated', totalDonated + amount);
    _box.put('almsgivingStreak', almsgivingStreak + 1);
    notifyListeners();
  }

  void incrementMercyCount() {
    _box.put('mercyCount', mercyCount + 1);
    notifyListeners();
  }

  // Modified to use displayDay
  void recordMercyLog(String description) {
    final logs = mercyLogs;
    logs.add({
      'description': description,
      'time': DateTime.now().toIso8601String(),
      'day': displayDay,
    });
    _box.put('mercyLogs', logs);
    incrementMercyCount();
    _box.put('almsgivingStreak', almsgivingStreak + 1);
    notifyListeners();
  }

  bool get isChallengeCompleted =>
      _box.get('challengeCompleted_$currentDay', defaultValue: false);

  // Daily challenge
  void completeChallenge() {
    _box.put('challengeCompleted_$currentDay', true);
    incrementPrayerStreak();
    _box.put('fastingStreak', fastingStreak + 1);
    _box.put('almsgivingStreak', almsgivingStreak + 1);
    notifyListeners();
  }

  // Confession methods
  void logConfession(int day) {
    _box.put('confession_$day', true);
    notifyListeners();
  }

  bool isConfessionLogged(int day) {
    return _box.get('confession_$day', defaultValue: false);
  }

  // Bible Study Notes
  String getStudyNote(String topic) {
    return _box.get('study_note_$topic', defaultValue: '');
  }

  void saveStudyNote(String topic, String note) {
    _box.put('study_note_$topic', note);
    notifyListeners();
  }

  // Notifications
  bool _notificationsEnabled = true;
  int _prayerHour = 8;
  int _prayerMinute = 0;
  int _fastHour = 7;
  int _fastMinute = 0;

  void _loadNotificationSettings() {
    _notificationsEnabled =
        _box.get('notificationsEnabled', defaultValue: true);
    _prayerHour = _box.get('prayerHour', defaultValue: 8);
    _prayerMinute = _box.get('prayerMinute', defaultValue: 0);
    _fastHour = _box.get('fastHour', defaultValue: 7);
    _fastMinute = _box.get('fastMinute', defaultValue: 0);
    scheduleDailyReminders();
  }

  bool get notificationsEnabled => _notificationsEnabled;
  int get prayerHour => _prayerHour;
  int get prayerMinute => _prayerMinute;
  int get fastHour => _fastHour;
  int get fastMinute => _fastMinute;

  void setNotificationsEnabled(bool value) {
    _notificationsEnabled = value;
    _box.put('notificationsEnabled', value);
    notifyListeners();
    scheduleDailyReminders();
  }

  void setPrayerTime(int hour, int minute) {
    _prayerHour = hour;
    _prayerMinute = minute;
    _box.put('prayerHour', hour);
    _box.put('prayerMinute', minute);
    notifyListeners();
    scheduleDailyReminders();
  }

  void setFastTime(int hour, int minute) {
    _fastHour = hour;
    _fastMinute = minute;
    _box.put('fastHour', hour);
    _box.put('fastMinute', minute);
    notifyListeners();
    scheduleDailyReminders();
  }

  void scheduleDailyReminders() {
    NotificationService.scheduleDailyReminders(
      enabled: _notificationsEnabled,
      prayerHour: _prayerHour,
      prayerMinute: _prayerMinute,
      fastHour: _fastHour,
      fastMinute: _fastMinute,
    );
  }

  void cancelAllReminders() {
    NotificationService.cancelAll();
  }

  // Calendar helpers
  bool isSunday(int day) {
    final date = lentStartDate.add(Duration(days: day - 1));
    return date.weekday == DateTime.sunday;
  }

  bool isFriday(int day) {
    final date = lentStartDate.add(Duration(days: day - 1));
    return date.weekday == DateTime.friday;
  }

  DateTime getLentDate(int day) {
    return lentStartDate.add(Duration(days: day - 1));
  }

  // Getters for display
  String getTodayTheme(AppLocalizations loc) {
    // Delegate to DailyData to ensure consistency with Detail Screen
    return DailyData.getDayDetail(displayDay, loc).theme;
  }

  String getTodayScripture(AppLocalizations loc) {
    final day = displayDay;
    String reference;
    String text;
    
    if (day == 47) {
      reference = loc.scriptureMatthew28;
      text = loc.scriptureMatthew28Text;
    } else if (day == 1) {
      reference = loc.scriptureJoel2;
      text = loc.scriptureJoel2Text;
    } else if (day % 7 == 3) {
      reference = loc.scriptureIsaiah58;
      text = loc.scriptureIsaiah58Text;
    } else if (day % 7 == 5) {
      reference = loc.scripturePsalm23;
      text = loc.scripturePsalm23Text;
    } else {
      reference = loc.scriptureMatthew6;
      text = loc.scriptureMatthew6Text;
    }

    return '"$text" - $reference';
  }

  String getDailyChallenge(AppLocalizations loc) {
    final day = displayDay;
    if (day == 47) return loc.challengeEaster;
    if (day % 7 == 3) return loc.challengeFriday;
    if (day % 7 == 5) return loc.challengeSunday;
    if (day % 7 == 1) return loc.challengeMonday;
    if (day % 7 == 3) return loc.challengeWednesday;
    return loc.challengeDefault;
  }

  // Fasting recommendations
  String getRecommendedFastType() {
    final day = displayDay;
    if (day == 1 || day == 46) return "Full Fast"; // Ash Wed or Good Friday
    if (isFriday(day)) return "Abstinence";
    return "Partial Fast";
  }

  // Journal Entry Management
  Map<int, Map<String, dynamic>> get journalEntries {
    final entries = _box.get('journalEntries', defaultValue: {});
    final Map<int, Map<String, dynamic>> result = {};
    if (entries is Map) {
      entries.forEach((key, value) {
        result[key as int] = Map<String, dynamic>.from(value as Map);
      });
    }
    return result;
  }

  void saveJournalEntry(int day, String content, {String? mood}) {
    final entries = journalEntries;
    entries[day] = {
      'day': day,
      'date': DateTime.now().toIso8601String(),
      'content': content,
      'mood': mood,
    };
    _box.put('journalEntries', entries);
    notifyListeners();
  }

  Map<String, dynamic>? getJournalEntry(int day) {
    return journalEntries[day];
  }

  List<Map<String, dynamic>> getAllJournalEntries() {
    final entries = journalEntries;
    final list = entries.values.toList();
    list.sort((a, b) => (b['day'] as int).compareTo(a['day'] as int));
    return list;
  }

  void deleteJournalEntry(int day) {
    final entries = journalEntries;
    entries.remove(day);
    _box.put('journalEntries', entries);
    notifyListeners();
  }
}
