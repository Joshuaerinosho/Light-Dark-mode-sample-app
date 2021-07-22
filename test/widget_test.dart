import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample/main.dart';
import 'package:sample/widgets.dart';

void main() {
  testWidgets('Backgraound Color Test', (WidgetTester tester) async {
    final button = find.byType(RoundButton);
    // Build app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify initial background color
    expect(
        (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
        Colors.white);
    // taps theme switch button
    await tester.tap(button);
    await tester.pump();
    // Verify new background color
    expect(
        (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
        Colors.white);
  });

  
  testWidgets('Backgraound Color Test2', (WidgetTester tester) async {
    final button = find.byType(RoundButton);
    final mainPage = find.byKey(ValueKey('main page'));
    // Build app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: MyApp()));
    // await tester.tap(button);
    // await tester.pump();
    // Verify new background color
    expect(mainPage, findsOneWidget);
  });
}
