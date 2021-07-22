// Imports the Flutter Driver API.
import 'package:sample/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

//Run this: flutter drive --target=test_driver/app.dart

void main() {
  late FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() {
    driver.close();
  });

  group('Theme Test', () {
    final themeButton = find.byValueKey('Button');
    final themeProvider = ThemeProvider();

    test('Switch between light and dark themes', () async {
      expect(themeProvider.mode, ThemeMode.light); //check initial theme
      await driver.tap(themeButton);
      expect(themeProvider.mode, ThemeMode.dark);  //check new theme
    });
  });
}
