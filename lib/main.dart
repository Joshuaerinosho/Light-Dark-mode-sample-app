import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/Themes.dart';
import 'package:sample/theme_provider.dart';
import 'package:sample/widgets.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isOn = true;

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
          home: Builder(builder: (context) {
            final bool _darkModeEnabled =
                Theme.of(context).brightness == Brightness.dark;
            _darkModeEnabled ? isOn = false : isOn = true;
            return Scaffold(
                key: ValueKey('main page'),
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
                            Provider.of<ThemeProvider>(context, listen: false)
                                .toggleMode();
                            setState(() {
                              isOn ? isOn = false : isOn = true;
                            });
                          },
                          icon: isOn ? Icons.dark_mode : Icons.light_mode,
                        )
                      ],
                    ),
                  ),
                ));
          }),
        ),
      ),
    );
  }
}
