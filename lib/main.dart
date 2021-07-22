import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/Themes.dart';
import 'package:sample/theme_provider.dart';
import 'package:sample/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (ctx, themeObject, _) => MaterialApp(
            title: 'Color test',
            themeMode: themeObject.mode,
            theme: lightTheme,
            darkTheme: darkTheme,
            home: Home()),
      ),
    );
  }
}
