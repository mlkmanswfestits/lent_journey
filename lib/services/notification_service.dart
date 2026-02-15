import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    try {
      if (kIsWeb)
        return; // Notifications not fully supported on web without extra config
      tz.initializeTimeZones();
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const InitializationSettings initializationSettings =
          InitializationSettings(android: initializationSettingsAndroid);
      await _notifications.initialize(initializationSettings);
    } catch (e) {
      debugPrint('Error initializing notifications: $e');
    }
  }

  static Future<void> scheduleDailyReminders({
    required bool enabled,
    required int prayerHour,
    required int prayerMinute,
    required int fastHour,
    required int fastMinute,
  }) async {
    if (kIsWeb) return;
    try {
      await _notifications.cancelAll();
      if (!enabled) return;

      // Prayer Reminder
      await _scheduleDailyReminder(
        id: 101,
        title: 'Time for Prayer',
        body: 'Take a moment for your Lenten conversation with God.',
        hour: prayerHour,
        minute: prayerMinute,
      );

      // Fasting Reminder
      await _scheduleDailyReminder(
        id: 102,
        title: 'Fasting Discipline',
        body: 'Keep strong in your Lenten fast today.',
        hour: fastHour,
        minute: fastMinute,
      );

      // Acts of Mercy Reminder
      await _scheduleDailyReminder(
        id: 103,
        title: 'Act of Mercy',
        body: 'Have you performed an act of mercy today?',
        hour: 15, // Default 3 PM (Hour of Mercy)
        minute: 0,
      );
    } catch (e) {
      debugPrint('Error scheduling notifications: $e');
    }
  }

  static Future<void> _scheduleDailyReminder({
    required int id,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    try {
      await _notifications.zonedSchedule(
        id,
        title,
        body,
        _nextInstanceOfTime(hour, minute),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'daily_reminders',
            'Daily Reminders',
            channelDescription: 'Daily Lenten reminders',
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (e) {
      debugPrint('Error scheduling reminder $id: $e');
    }
  }

  static tz.TZDateTime _nextInstanceOfTime(int hour, int minute) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  static Future<void> cancelAll() async {
    if (kIsWeb) return;
    try {
      await _notifications.cancelAll();
    } catch (e) {
      debugPrint('Error canceling notifications: $e');
    }
  }
}
