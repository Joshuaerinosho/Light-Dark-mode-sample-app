import 'package:flutter/material.dart';
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