import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals/main.dart';

void main() {
  testWidgets('App launches and builds TabsScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    // Basic sanity check to see app builds and a widget from TabsScreen is present
    expect(find.byType(App), findsOneWidget);
    expect(find.byType(Scaffold), findsWidgets); // assuming TabsScreen uses Scaffold
  });
}
