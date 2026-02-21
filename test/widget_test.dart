import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Layout shows icons and text on a separate row',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Layout Exam.'), findsOneWidget);
    expect(find.text('My Std.ID is 67130700323'), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.music_note), findsOneWidget);
    expect(find.byIcon(Icons.beach_access), findsOneWidget);

    // Verify Column layout with two Rows
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);
  });
}
