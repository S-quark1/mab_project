import 'package:flutter/material.dart';
import 'package:tadam/LocaleString.dart';
import 'package:tadam/Movies.dart';
import 'package:tadam/AboutUs.dart';
import 'package:tadam/Search.dart';
import 'package:tadam/WhatNew.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
IconData _iconLight = Icons.wb_sunny_outlined;
IconData _iconDark = Icons.nights_stay_outlined;

var _LightTheme = ThemeData(
    primarySwatch: Colors.deepPurple,
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.black),
        iconTheme: IconThemeData(
          color: Colors.black,
        )));

var _DarkTheme = ThemeData(
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(
          color: Colors.white,
        )));

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour > 6 && hour < 9) {
      return 'goodmorning'.tr;
    }
    if (hour > 9 && hour < 18) {
      return 'goodafternoon'.tr;
    }
    if (hour > 18 && hour < 23) {
      return 'goodevening'.tr;
    }
    return 'goodnight'.tr;
  }

  final screens = [
    const Search(),
    const Creators(),
    const Information(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
        locale: Locale('en','US'),
        debugShowCheckedModeBanner: false,
        theme: _iconBool ? _DarkTheme : _LightTheme,
        home: Scaffold(
          body: screens[index],
          extendBody: true,
          appBar: AppBar(
            toolbarHeight: 60,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 5.0),
              child: Text(
                greeting(),
                style: const TextStyle(
                  fontSize: 23,
                  fontFamily: "Zagolovok",
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      _iconBool = !_iconBool;
                    });
                  },
                  icon: Icon(
                    _iconBool ? _iconDark : _iconLight,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondRoute()),
                    );
                  },
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                  ))
            ],
          ),
          bottomNavigationBar: _navivi(),
        ));
  }

  Widget _navivi() {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xA4030202), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.0, 1],
            tileMode: TileMode.clamp,
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.transparent,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          selectedIndex: index,
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                selectedIcon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Search'),
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
              label: "About",
            ),
          ],
        ));
  }
}
