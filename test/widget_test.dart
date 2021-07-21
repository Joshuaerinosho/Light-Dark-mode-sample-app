import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample/constants.dart';
import 'package:sample/main.dart';

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
        Colors.grey);
  });
}
