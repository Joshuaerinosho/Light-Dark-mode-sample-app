import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample/main.dart';
import 'package:sample/widgets.dart';

void main() {
  testWidgets("Check background Color from render object", (tester) async {
    await tester.pumpWidget(MyApp());

    //check initial background color from render object
    expect(
        (tester.renderObject(find.byType(Scaffold)) as RenderPhysicalModel)
            .color,
        Colors.white);

    //tap theme switch button
    await tester.tap(find.byType(RoundButton));
    await tester.pumpAndSettle();

    // Check the background color after theme switch
    expect(
        (tester.renderObject(find.byType(Scaffold)) as RenderPhysicalModel)
            .color,
        Colors.grey[700]);
  });
}
