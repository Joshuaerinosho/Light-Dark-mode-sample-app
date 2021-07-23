import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample/main.dart';
import 'package:sample/widgets.dart';

void main() {

  testWidgets("Check Scaffold backGround Color", (tester) async {
    await tester.pumpWidget(MyApp());

    //check initial background color
    expect((tester.firstWidget(find.byType(Scaffold))as
     Scaffold).backgroundColor, Colors.white);

     //taps the theme switch button
     await tester.tap(find.byType(RoundButton));
     await tester.pumpAndSettle();

     //confirm new background color
    expect((tester.firstWidget(find.byType(Scaffold))as
     Scaffold).backgroundColor, Colors.grey[700]);
  });
}