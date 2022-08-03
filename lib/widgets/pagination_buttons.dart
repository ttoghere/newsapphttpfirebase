// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PaginationButtons extends StatelessWidget {
  final String text;
  final Color surfaceColor;
  final Color textColor;
  final VoidCallback voidCallback;
  final double padding;
  const PaginationButtons({
    Key? key,
    required this.text,
    required this.surfaceColor,
    required this.textColor,
    required this.voidCallback,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: surfaceColor,
          onPrimary: textColor,
          padding: const EdgeInsets.all(6),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          )),
      onPressed: voidCallback,
      child: Text(text),
    );
  }
}
