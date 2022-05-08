// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tadam/Back_End/models/search.dart';
import 'package:tadam/Back_End/services/Imgbb_image_storage.dart';
import 'package:tadam/Back_End/services/remote_service.dart';
import 'package:image_picker/image_picker.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GetMovie? movieObject;
  var isLoaded = false;
  var idle = true; // тут я хотела красиво сделать но что-то пошло не так
  File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //picks the image
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No image selected'),
      ));
      return;
    }
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  // gets the data
  _getData(
      var imageUrl,
      ) async {
    if (imageUrl == '') {
      imageUrl =
      'https://ic.pics.livejournal.com/mr_vang/85384635/290587/290587_original.jpg';
    }
    movieObject = await RemoteService().getFilm(imageUrl);
    if (movieObject != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Imgbb imgbb = Imgbb();
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
                  child: const Text('Upload photo'),
                  onPressed: () async {
                    isLoaded = false;
                    await getImage();
                    imgbb
                        .uploadImageFile(_image!)
                        .then((value) => _getData(value));
                  },
                ),
                Visibility(
                  visible: isLoaded,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      textDirection: TextDirection.ltr,
                      // textAlign: Alignment.center,
                      text: TextSpan(
                        text: "result is:\n",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        children:
                        <TextSpan>[
                          const TextSpan(text: 'name of the movie: '),
                          TextSpan(
                              text: movieObject
                                  ?.imageResults![0].snippetHighlightedWords![0] ?? "sorry, couldn't find",
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 113, 23, 219))),
                          const TextSpan(text: '\ndescription: '),
                          TextSpan(
                              text: movieObject?.imageResults![0].snippet ?? "sorry, couldn't find",
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 113, 23, 219))),
                          const TextSpan(text: '\nmore on: '),
                          TextSpan(
                              text: movieObject?.imageResults![0].link ?? "sorry, couldn't find",
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 113, 23, 219))),
                        ],
                      ),
                    ),
                  ),
                  replacement: const Center(child: Text('waiting for the request...')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}