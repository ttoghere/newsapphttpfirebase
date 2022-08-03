// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget {
  final double width;
  final Widget child;
  const HorizontalSpacing({
    Key? key,
    required this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: child,
    );
  }
}
