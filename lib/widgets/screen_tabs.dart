import 'package:flutter/material.dart';


class ScreenTabs extends StatelessWidget {
  final String text;
  final VoidCallback fct;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const ScreenTabs({
    Key? key,
    required this.text,
    required this.fct,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fct,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          ),
        ),
      ),
    );
  }
}
