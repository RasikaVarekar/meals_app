// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:meals/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
   testWidgets('App launches and builds TabsScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // Basic sanity check to see app builds and a widget from TabsScreen is present
    expect(find.byType(App), findsOneWidget);
    expect(find.byType(Scaffold), findsWidgets); // assuming TabsScreen uses Scaffold
  });
  });
}
