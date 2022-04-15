import 'package:get_movie/models/search.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<GetMovie?> getFilm() async {
    var client = http.Client();

    var uri = Uri.parse('https://serpapi.com/search.json?engine=google_reverse_image&image_url=https://i.imgur.com/5bGzZi7.jpg&api_key=9842b2bfbd369a2feee9becf8824520845487e9ab6a99d8d87fccfab61b55572');

    var imageUrl = 'https://www.hbo.com/content/dam/hbodata/series/game-of-thrones/episodes/1/1/winter-is-coming-04-1920.jpg/_jcr_content/renditions/cq5dam.web.1200.675.jpeg';
    var url = Uri.parse('https://serpapi.com/search.json');
    var response = await client.get(uri);
    // var response = await client.get(url, headers: {
    //   'engine': 'google_reverse_image',
    //   'image_url': imageUrl,
    //   'api_key':
    //       '9842b2bfbd369a2feee9becf8824520845487e9ab6a99d8d87fccfab61b55572'
    // });
    if (response.statusCode == 200){
      var json = response.body;
      return getMovieFromJson(json);
    }
    return null;
  }
}
