import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsType {
  topTrending,
  allNews,
}

enum SortByEnum {
  relevancy,
  popularity,
  publishedAt,
}

String drawerPic =
    "https://image.shutterstock.com/image-photo/business-newspaper-isolated-on-white-600w-1272343108.jpg";
String articlePic =
    "https://scontent.fadb2-1.fna.fbcdn.net/v/t39.30808-6/279418699_1464850347300483_3230164680752958616_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=XlY8LCOfg7kAX8-DTMP&_nc_ht=scontent.fadb2-1.fna&oh=00_AT9OSolnq110p156EC7I9KRKFL2k3afKZ4tR_2x-VeV34w&oe=62EE8BA8";

TextStyle smallText = GoogleFonts.montserrat(fontSize: 15);
