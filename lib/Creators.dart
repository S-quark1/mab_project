import 'package:flutter/material.dart';

class Creators extends StatefulWidget {
  const Creators({Key? key}) : super(key: key);

  @override
  State<Creators> createState() => _CreatorsState();
}

class _CreatorsState extends State<Creators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: ListView(
          children: [
            Container(
              height: 40.0,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text(
                        "All",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text(
                        "Anime",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text(
                        "Adventure",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Chip(
                      label: Text(
                        "Comedian",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.purple,
                      padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0,),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Top Trends",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontFamily: "Zagolovok",
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              width: double.infinity,
              height: 230.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "Gladiator", "9/10", "assets/image/gladiator.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "Grand Budapest Hotel", "8.5/10", "assets/image/grand.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "Interstellar", "10/10", "assets/image/inter.jpg"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25.0,),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Top Anime",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontFamily: "Zagolovok",
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ), //ANIMEEEEEE
            const SizedBox(
              height: 12.0,
            ),
            Container(
              width: double.infinity,
              height: 230.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "Baki: The Grappler", "9.7/10", "assets/image/anime/baki.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "Hunter X Hunter", "8.5/10", "assets/image/anime/hxh.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "Dragon Ball Z", "10/10", "assets/image/anime/dbz.jpg"),
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Top Drama",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontFamily: "Zagolovok",
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ), // DRAMAAAAA
            const SizedBox(
              height: 12.0,
            ),
            Container(
              width: double.infinity,
              height: 230.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "Green Book", "9.7/10", "assets/image/Drama/greenbook.jpeg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "Joker", "8.5/10", "assets/image/Drama/joker.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "The Green Mile", "10/10", "assets/image/Drama/greenmile.jpg"),
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Top Horror",
                    style: TextStyle(
                      color: Colors.purple,
                      fontFamily: "Zagolovok",
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ), //HORROR
            const SizedBox(
              height: 12.0,
            ),
            Container(
              width: double.infinity,
              height: 230.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "Scream", "9.7/10", "assets/image/horror/scream.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "Annabelle", "8.5/10", "assets/image/horror/anabel.jpg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: MovieCard(
                        "IT", "10/10", "assets/image/horror/IT.jpg"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget MovieCard(String moviename, String rate, String imgPath) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Card(
            elevation: 0.0,
            child: Image.asset(
              imgPath,
              fit: BoxFit.fill,
              width: 130.0,
              height: 160.0,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            moviename,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            rate,
            style: const TextStyle(fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
