// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:newsapphttpfirebase/consts/vars.dart';
import 'package:newsapphttpfirebase/widgets/articles_widget.dart';
import 'package:newsapphttpfirebase/widgets/horizontal_spacing.dart';
import 'package:newsapphttpfirebase/widgets/loading_widget.dart';
import 'package:newsapphttpfirebase/widgets/main_drawer.dart';
import 'package:newsapphttpfirebase/widgets/vertical_spacing.dart';

import '../widgets/pagination_buttons.dart';
import '../widgets/screen_tabs.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homepage";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  var newsType = NewsType.allNews;
  String sortBy = SortByEnum.publishedAt.name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyBold.search,
              ),
            ),
          ],
          title: Text(
            "News App",
            style: GoogleFonts.comicNeue()
                .copyWith(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      ScreenTabs(
                        text: "All News",
                        fct: () {
                          if (newsType == NewsType.allNews) {
                            return;
                          }
                          setState(() {
                            newsType = NewsType.allNews;
                          });
                        },
                        color: newsType == NewsType.allNews
                            ? Theme.of(context).cardColor
                            : Colors.transparent,
                        fontSize: 22,
                        fontWeight: newsType == NewsType.allNews
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                      HorizontalSpacing(
                        width: 20,
                        child: Container(),
                      ),
                      ScreenTabs(
                        text: "Top Trending",
                        fct: () {
                          if (newsType == NewsType.topTrending) {
                            return;
                          }
                          setState(() {
                            newsType = NewsType.topTrending;
                          });
                        },
                        color: newsType == NewsType.topTrending
                            ? Theme.of(context).cardColor
                            : Colors.transparent,
                        fontSize: 22,
                        fontWeight: newsType == NewsType.topTrending
                            ? FontWeight.bold
                            : FontWeight.w500,
                      ),
                    ],
                  ),
                  VerticalSpacing(
                    height: 5,
                    child: Container(),
                  ),
                  VerticalSpacing(
                    height: kBottomNavigationBarHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PaginationButtons(
                          padding: 5,
                          text: "Prev",
                          surfaceColor: Colors.red[900]!,
                          textColor: Colors.white,
                          voidCallback: () {
                            setState(() {
                              if (currentIndex == 0) {
                                return;
                              }
                              setState(() {
                                currentIndex -= 1;
                              });
                            });
                          },
                        ),
                        Flexible(
                          flex: 2,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Material(
                                color: currentIndex == index
                                    ? Colors.red
                                    : Theme.of(context).cardColor,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                    print("${index + 1}");
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${index + 1}",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            itemCount: 6,
                          ),
                        ),
                        PaginationButtons(
                          padding: 5,
                          text: "Next",
                          surfaceColor: Colors.red[900]!,
                          textColor: Colors.white,
                          voidCallback: () {
                            setState(() {
                              if (currentIndex == 5) {
                                return;
                              }
                              setState(() {
                                currentIndex += 1;
                              });
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  VerticalSpacing(
                    height: 50,
                    child: newsType == NewsType.topTrending
                        ? Container()
                        : Align(
                            alignment: Alignment.topRight,
                            child: Material(
                              color: Theme.of(context).cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: DropdownButton(
                                    value: sortBy,
                                    items: dropdownItems,
                                    onChanged: (String? value) {}),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            LoadingWidget(),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItem = [
      DropdownMenuItem(
        value: SortByEnum.popularity.name,
        child: Text(
          SortByEnum.popularity.name,
        ),
      ),
      DropdownMenuItem(
        value: SortByEnum.publishedAt.name,
        child: Text(
          SortByEnum.publishedAt.name,
        ),
      ),
      DropdownMenuItem(
        value: SortByEnum.relevancy.name,
        child: Text(
          SortByEnum.relevancy.name,
        ),
      ),
    ];
    return menuItem;
  }
}
