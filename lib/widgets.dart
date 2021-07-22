import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/constants.dart';
import 'package:sample/theme_provider.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
bool isOn = true;
  @override
  Widget build(BuildContext context) {
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
  }
}






class RoundButton extends StatelessWidget {
  const RoundButton({Key? key, required this.onTap, required this.icon})
      : super(key: key);
  final Function() onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(360),
          boxShadow: [
            BoxShadow(color: Colors.grey,
            spreadRadius: 1.5,
            blurRadius: 5.0
            ),
            ],
        ),
        child: Center(child: Icon(icon)),
      ),
    );
  }
}