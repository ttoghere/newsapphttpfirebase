import 'package:flutter/material.dart';
import 'package:newsapphttpfirebase/providers/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils({required this.context});
  bool get getTheme => Provider.of<DarkThemeProvider>(context).getDarkTheme;
  Color get getColor => getTheme ? Colors.white : Colors.black;
  Size get getScreenSize => MediaQuery.of(context).size;
  Color get baseShimmer => getTheme ? Colors.red[600]! : Colors.red[200]!;
  Color get highlightShimmer => getTheme ? Colors.red[700]! : Colors.red[400]!;
  Color get widgetShimmer => getTheme ? Colors.red[500]! : Colors.red[100]!;
}
