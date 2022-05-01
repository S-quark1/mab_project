import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';

// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/Imgbb_response.dart';
import '../models/search.dart';
import '../services/remote_service.dart';

class ImgbbSearch extends StatefulWidget {
  const ImgbbSearch({Key? key}) : super(key: key);

  @override
  _ImgbbSearchState createState() => _ImgbbSearchState();
}

class _ImgbbSearchState extends State<ImgbbSearch> {
  GetMovie? movieObject;
  bool delay = true;
  bool loading = false;
  String txt = 'Upload Image';
  Dio dio = Dio();
  late ImgbbResponse imgbbResponse;

  late File _image;
  final picker = ImagePicker();

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

  Future<String> uploadImageFile(File _image) async {
    setState(() {
      loading = true;
    });
    ByteData bytes = await rootBundle.load(_image.path);
    var buffer = bytes.buffer;
    var m = base64.encode(Uint8List.view(buffer));

    FormData formData = FormData.fromMap(
        {"key": 'eda9abc46fc3adaaa77c1da20bdaa057', "image": m});

    Response response = await dio.post(
      "https://api.imgbb.com/1/upload",
      data: formData,
    );
    print(response.data);
    if (response.statusCode != 400) {
      imgbbResponse = ImgbbResponse.fromJson(response.data);
      setState(() {
        delay = false;
        loading = false;
      });
      return imgbbResponse.data.url;
    } else {
      txt = 'Error Upload';
      setState(() {
        loading = false;
      });
      return '';
    }
  }

  _getData(
    var imageUrl,
  ) async {
    if (imageUrl == '') {
      imageUrl =
          'https://ic.pics.livejournal.com/mr_vang/85384635/290587/290587_original.jpg';
    }
    movieObject = await RemoteService().getFilm(imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayo"),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await getImage();
                    uploadImageFile(_image).then((value) {
                      _getData(value);
                    });
                  },
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                delay
                    ? Text(txt)
                    : CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            NetworkImage(imgbbResponse.data.displayUrl),
                      ),
                const Spacer(),
                const Text('https://imgur.com/4NH3806.png')
              ],
            )),
    );
  }
}
