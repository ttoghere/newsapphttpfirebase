import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapphttpfirebase/consts/vars.dart';
import 'package:newsapphttpfirebase/inner_screens/search_screen.dart';
import 'package:newsapphttpfirebase/services/utils.dart';
import 'package:newsapphttpfirebase/widgets/articles_widget.dart';
import 'package:newsapphttpfirebase/widgets/empty_screen.dart';
import 'package:page_transition/page_transition.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).getScreenSize;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bookmarks",
          style: GoogleFonts.comicNeue()
              .copyWith(fontSize: 20, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: 
      EmptyNewsWidget(text: "Nothing in bookmarks yet!!", imagePath: drawerPic)
      // ListView.builder(
      //   itemCount: 20,
      //   itemBuilder: (context, index) {
      //     return ArticlesWidget();
      //   },
      // ),
    );
  }
}
