// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:lent_journey_catholic/main.dart';

void main() {
  setUp(() async {
    // Initialize Hive with a temporary directory for testing
    // Note: Use hive_test package if available, otherwise mock it.
    // For now, we'll try to keep it simple.
  });

  testWidgets('Lent Journey Home Screen test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const LentJourneyApp());

    // Verify that the title is present.
    expect(find.text('Lent Journey'), findsOneWidget);

    // Verify that the Lenten Pillars Tracker is present.
    expect(find.text('Lenten Pillars Tracker'), findsOneWidget);
  });
}
