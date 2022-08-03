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
String pic404 =
    "https://scontent.fadb2-1.fna.fbcdn.net/v/t1.6435-9/140319041_1151557678629753_2291501919177660954_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=e3f864&_nc_ohc=0kicSVdOJIoAX_bctw2&tn=PwJU-z217FrMirem&_nc_ht=scontent.fadb2-1.fna&oh=00_AT-mlJ64veFj3d-C9mySnGkU6OKVRpWpKEZtFhKRLYib_Q&oe=630FAE7F";
TextStyle smallText = GoogleFonts.montserrat(fontSize: 15);

const List<String> searchKeywords = [
  "Football",
  "Flutter",
  "Swift",
  "Phyton",
  "Weather",
  "Crypto",
  "Bitcoin",
  "Instagram",
  "Netflix",
  "Meta",
];
