import 'package:flutter/material.dart';
import 'package:tadam/Creators.dart';
import 'package:tadam/Information.dart';
import 'package:tadam/Search.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: "Tadam",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

bool _iconBool = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

var _LightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  brightness: Brightness.light,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
);

var _DarkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
);

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

//Search(),
// Creators(),
// About(),

  final screens = [
    const Search(),
    const Creators(),
    const Information(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _iconBool ? _DarkTheme : _LightTheme,
        home: Scaffold(
          body: screens[index],
          appBar: AppBar(
            title: const Text(
              'TADAM',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _iconBool = !_iconBool;
                    });
                  },
                  icon: Icon(_iconBool ? _iconDark : _iconLight))
            ],
          ),
          bottomNavigationBar: NavigationBarTheme(
              data: NavigationBarThemeData(
                  indicatorColor: Colors.purpleAccent,
                  labelTextStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  )),
              child: NavigationBar(
                height: 60,
                backgroundColor: Colors.transparent,
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                selectedIndex: index,
                animationDuration: const Duration(seconds: 1),
                onDestinationSelected: (index) =>
                    setState(() => this.index = index),
                destinations: const [
                  NavigationDestination(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      selectedIcon: Icon(
                        Icons.youtube_searched_for,
                        size: 30,
                      ),
                      label: "Search"),
                  NavigationDestination(
                      icon: Icon(
                        Icons.movie_creation_outlined,
                        size: 30,
                      ),
                      selectedIcon: Icon(
                        Icons.movie,
                        size: 30,
                      ),
                      label: "Movies"),
                  NavigationDestination(
                      icon: Icon(
                        Icons.info_outline,
                        size: 30,
                      ),
                      selectedIcon: Icon(
                        Icons.info,
                        size: 30,
                      ),
                      label: "About"),
                ],
              )),
        ));
  }
}
