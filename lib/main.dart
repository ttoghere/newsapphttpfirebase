import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapphttpfirebase/inner_screens/blog_details.dart';
import 'package:newsapphttpfirebase/providers/dark_theme_provider.dart';
import 'package:newsapphttpfirebase/screens/home_page.dart';
import 'package:provider/provider.dart';
import 'consts/theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePref.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        })
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: Styles.themeData(themeProvider.getDarkTheme, context),
          home: const HomeScreen(),
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            NewsDetailsScreen.routeName: (context) => const NewsDetailsScreen(),
          },
        );
      }),
    );
  }
}
