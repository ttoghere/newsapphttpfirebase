// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapphttpfirebase/consts/const_variables.dart';
import 'package:newsapphttpfirebase/providers/dark_theme_provider.dart';
import 'package:newsapphttpfirebase/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Image.network(
                    drawerPic,
                    height: 70,
                    width: 70,
                  )),
                  const VerticalSpacing(height: 20),
                  Flexible(
                    child: Text(
                      'News app',
                      style: GoogleFonts.comicNeue()
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpacing(height: 20),
            DrawerListTiles(
              text: "Home",
              iconData: IconlyBold.home,
              fct: () {},
            ),
            DrawerListTiles(
              text: "Bookmark",
              iconData: IconlyBold.bookmark,
              fct: () {},
            ),
            const Divider(
              thickness: 5,
            ),
            SwitchListTile(
                title: Text(
                  themeProvider.getDarkTheme ? 'Dark' : 'Light',
                  style: const TextStyle(fontSize: 20),
                ),
                secondary: Icon(
                  themeProvider.getDarkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                value: themeProvider.getDarkTheme,
                onChanged: (bool value) {
                  setState(() {
                    themeProvider.setDarkTheme = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class DrawerListTiles extends StatelessWidget {
  final String text;
  final IconData iconData;
  final VoidCallback fct;
  const DrawerListTiles({
    Key? key,
    required this.text,
    required this.iconData,
    required this.fct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Icon(iconData),
      title: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
      onTap: fct,
    );
  }
}
