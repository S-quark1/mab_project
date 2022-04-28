// To parse this JSON data, do
//
//     final imgbbResponse = imgbbResponseFromJson(jsonString);

import 'dart:convert';

ImgbbResponse imgbbResponseFromJson(String str) => ImgbbResponse.fromJson(json.decode(str));

String imgbbResponseToJson(ImgbbResponse data) => json.encode(data.toJson());

class ImgbbResponse {
  ImgbbResponse({
    required this.data,
    required this.success,
    required this.status,
  });

  Data data;
  bool success;
  int status;

  factory ImgbbResponse.fromJson(Map<String, dynamic> json) => ImgbbResponse(
    data: Data.fromJson(json["data"]),
    success: json["success"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
    "status": status,
  };
}

class Data {
  Data({
    this.id,
    this.title,
    this.urlViewer,
    required this.url,
    required this.displayUrl,
    this.width,
    this.height,
    this.size,
    this.time,
    this.expiration,
    // required this.image,
    // required this.thumb,
    // required this.medium,
    required this.deleteUrl,
  });

  String? id;
  String? title;
  String? urlViewer;
  String url;
  String displayUrl;
  String? width;
  String? height;
  int? size;
  String? time;
  String? expiration;
  // Image image;
  // Image thumb;
  // Image medium;
  String deleteUrl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    urlViewer: json["url_viewer"],
    url: json["url"],
    displayUrl: json["display_url"],
    width: json["width"],
    height: json["height"],
    size: json["size"],
    time: json["time"],
    expiration: json["expiration"],
    // image: Image.fromJson(json["image"]),
    // thumb: Image.fromJson(json["thumb"]),
    // medium: Image.fromJson(json["medium"]),
    deleteUrl: json["delete_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "url_viewer": urlViewer,
    "url": url,
    "display_url": displayUrl,
    "width": width,
    "height": height,
    "size": size,
    "time": time,
    "expiration": expiration,
    // "image": image.toJson(),
    // "thumb": thumb.toJson(),
    // "medium": medium.toJson(),
    "delete_url": deleteUrl,
  };
}

// class Image {
//   Image({
//     this.filename,
//     this.name,
//     this.mime,
//     this.extension,
//     this.url,
//   });
//
//   String? filename;
//   String? name;
//   String? mime;
//   String? extension;
//   String? url;
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//     filename: json["filename"],
//     name: json["name"],
//     mime: json["mime"],
//     extension: json["extension"],
//     url: json["url"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "filename": filename,
//     "name": name,
//     "mime": mime,
//     "extension": extension,
//     "url": url,
//   };
// }
