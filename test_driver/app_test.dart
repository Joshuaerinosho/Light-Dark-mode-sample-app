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
  group('Menu Test', () {
    final newAssetButton = find.byValueKey('NewAssetButton');
    final searchButton = find.byValueKey('SearchButton');
    final searchScreenContent = find.byValueKey('search screen');

    test('Checks first screen is assets screen', () async {
      await driver.waitFor(find.byValueKey('dropdown'));
    });

    test('Navigate to search screen', () async {
      await driver.tap(searchButton);
      //checks the content on search screen
      await driver.getText(searchScreenContent);
    });

    test('Navigate back to assets screen', () async {
      await driver.tap(newAssetButton);
      //checks the content on assets screen
      await driver.waitFor(find.byValueKey('dropdown'));
    });
  });

  group('Theme Test', () {
    //final lightThemeButton = find.text('Light theme');
    final darkThemeButton = find.text('Dark theme');
    final settingsButton = find.byValueKey('SettingsButton');
    final themeProvider = ThemeProvider();

   
    test('Check background theme', ()async{
     expect(themeProvider.mode, ThemeMode.light);
     await driver.tap(settingsButton);
     await driver.tap(darkThemeButton);
     expect(themeProvider.mode, ThemeMode.dark);
    });

    // test('Switch between light and dark themes', () async {
    //   await driver.tap(settingsButton);
    //   await driver.getText(darkThemeButton);
    //   await driver.tap(find.byValueKey('ThemeButton'));
    //   await driver.getText(lightThemeButton);
    // });
    
  });
}