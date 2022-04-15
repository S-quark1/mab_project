import 'package:flutter/material.dart';
import 'package:get_movie/models/search.dart';
import 'package:get_movie/services/remote_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GetMovie? movieObject;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  _getData() async {
    movieObject = await RemoteService().getFilm();
    if (movieObject != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Send request to server'),
                  onPressed: () {
                    _getData();
                  },
                ),
                // Visibility(
                //   visible: isLoaded,
                //   child: Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child:
                    RichText(
                      textDirection: TextDirection.ltr,
                      // textAlign: Alignment.center,
                      text: TextSpan(
                        text: "result is:\n",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        children: <TextSpan>[
                          const TextSpan(text: 'name of the movie: '),
                          TextSpan(
                              text: movieObject?.searchInformation.queryDisplayed,
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 113, 23, 219))),
                          const TextSpan(text: '\ndescription: '),
                          TextSpan(
                              text: movieObject?.imageResults[0].snippet,
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 113, 23, 219))),
                        ],
                      ),
                    ),
                  // ),
                  // replacement: const Center(
                  //   child: CircularProgressIndicator(),
                  // ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
