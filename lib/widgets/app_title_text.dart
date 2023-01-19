import 'package:flutter/material.dart';

class AppTitleText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const AppTitleText(
      {Key? key,
        required this.text,
        this.color = const Color(0xff312da4),
        this.size = 30.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.bold
      ),
    );
  }
}