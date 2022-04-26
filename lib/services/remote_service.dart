import 'package:get_movie/models/search.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<GetMovie?> getFilm(
    var imageUrl,
  ) async {
    var client = http.Client();

    // var uri = Uri.parse('https://serpapi.com/search.json?engine=google_reverse_image&image_url=https://i.imgur.com/5bGzZi7.jpg&api_key=9842b2bfbd369a2feee9becf8824520845487e9ab6a99d8d87fccfab61b55572');

    // var imageUrl = 'https://avatars.mds.yandex.net/get-ott/224348/2a0000016128aa76c17a22aa251619a76717/1344x756';
    var url = Uri.parse(
        'https://serpapi.com/search.json?engine=google_reverse_image&image_url=$imageUrl&api_key=9842b2bfbd369a2feee9becf8824520845487e9ab6a99d8d87fccfab61b55572');
    print(url);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var json = response.body;
      // print(json);
      return getMovieFromJson(json);
    }
    return null;
  }
}
