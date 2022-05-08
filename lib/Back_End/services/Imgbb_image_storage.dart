import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';

// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../models/Imgbb_response.dart';

class Imgbb {
  Dio dio = Dio();
  late ImgbbResponse imgbbResponse;

  Future<String> uploadImageFile(File _image) async {
    final bytes = File(_image.path).readAsBytesSync();
    // ByteData bytes = await rootBundle.load(_image.path);
    var buffer = bytes.buffer;
    var m = base64.encode(Uint8List.view(buffer));

    FormData formData = FormData.fromMap(
        {"key": 'd23615e2043fea129c10100f86bcdbe6', "image": m});

    Response response = await dio.post(
      "https://api.imgbb.com/1/upload",
      data: formData,
    );
    print("all good");
    if (response.statusCode != 400) {
      imgbbResponse = ImgbbResponse.fromJson(response.data);
      return imgbbResponse.data.url;
    } else {
      return '';
    }
  }
}