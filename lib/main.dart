import 'package:flutter/material.dart';
import 'package:sample/Themes.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color test',
      theme: isDark ? darkTheme : lightTheme,
      darkTheme: darkTheme,
      home: Builder(
        builder: (context) => Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text('Background Color Test'),
              centerTitle: true,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: mainAxisAlignment,
                  children: [
                    RoundButton(
                      key: ValueKey('Button'),
                      onTap: () {
                        setState(() {
                          isDark = !isDark;
                        });
                      },
                      icon: isDark ? Icons.light_mode : Icons.dark_mode,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
