
import 'package:http/http.dart' as http;
import 'package:tadam/Back_End/models/search.dart';

class RemoteService {
  Future<GetMovie?> getFilm(
      var imageUrl,
      ) async {
    var client = http.Client();

    var url = Uri.parse(
        'https://serpapi.com/search.json?engine=google_reverse_image&image_url=$imageUrl&api_key=9842b2bfbd369a2feee9becf8824520845487e9ab6a99d8d87fccfab61b55572');
    // print(url);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var json = response.body;
      return getMovieFromJson(json);
    }
    return null;
  }
}