import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const AppText(
      {Key? key,
      required this.text,
      this.color = const Color(0xff707070),
      this.size = 10.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'Poppins',
      ),
    );
  }
}
