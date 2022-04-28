// import 'dart:html';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_movie/models/search.dart';
import 'package:get_movie/services/Imgbb_image_storage.dart';
import 'package:get_movie/services/image_storage_service.dart';
import 'package:get_movie/services/remote_service.dart';
import 'package:image_picker/image_picker.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  GetMovie? movieObject;
  var isLoaded = false;
  File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
    // final ImageStorage storage = ImageStorage();
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
                    await getImage();
                    imgbb
                        .uploadImageFile(_image!)
                        .then((value) => _getData(value));
                    // storage.uploadFile(_path, _filename).then((value) {
                    //   // print(value);
                    //   _getData(value);
                    // });
                  },
                ),
                Visibility(
                  visible: isLoaded,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RichText(
                      textDirection: TextDirection.ltr,
                      // textAlign: Alignment.center,
                      text: TextSpan(
                        text: "result is:\n",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0)),
                        children: <TextSpan>[
                          const TextSpan(text: 'name of the movie: '),
                          TextSpan(
                              text: movieObject
                                  ?.imageResults[0].snippetHighlightedWords[0],
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 113, 23, 219))),
                          const TextSpan(text: '\ndescription: '),
                          TextSpan(
                              text: movieObject?.imageResults[0].snippet,
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 113, 23, 219))),
                          const TextSpan(text: '\nmore on: '),
                          TextSpan(
                              text: movieObject?.imageResults[0].link,
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Color.fromARGB(255, 113, 23, 219))),
                        ],
                      ),
                    ),
                  ),
                  replacement: const Center(child: Text('waiting...')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
