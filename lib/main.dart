import 'package:flutter/material.dart';
import 'package:get_movie/views/search_page.dart';

void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Node server demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SearchPage()
      // home: Scaffold(
      //   appBar: AppBar(title: Text('Flutter Client')),
      //   body: BodyWidget(),
      // ),
    );
  }
}
