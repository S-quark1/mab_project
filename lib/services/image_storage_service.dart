import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class ImageStorage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> uploadFile(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);
    try {
      await storage.ref('films/$fileName').putFile(file);
      String url =
          (await storage.ref('films/$fileName').getDownloadURL()).toString();
      // print('********************************');
      // print(filePath);
      // print(fileName);
      // print(url);
      return url;
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
    return '';
  }
}
