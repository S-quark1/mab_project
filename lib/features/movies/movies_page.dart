import 'package:flutter/material.dart';
import 'package:tadam/start.dart';

import 'widgets/widgets.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 20.0,bottom: 10.0),
              child: IconButton( onPressed: (){

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyHomePage(title: 'efwe')),
                );

              },icon: Icon(Icons.arrow_back_outlined, size: 28,)),
            ),
          ],
        ),
        toolbarHeight: 50,
        elevation:0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          labelStyle: TextStyle(fontSize: 20.0, fontFamily: 'Zagolovok'),
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Chaplin'),
            Tab(text: 'Saryarqa'),
            Tab(text: 'Keruen'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MoviesView(),
          MoviesView(),
          MoviesView(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}