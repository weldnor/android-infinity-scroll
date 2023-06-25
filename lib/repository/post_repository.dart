import 'package:http/http.dart' as http;
import 'package:infinity_scroll/domain/post.dart';
import 'package:xml/xml.dart';

abstract class AbstractPostRepository {
  Future<List<Post>> getPosts(int page, int perPage);
}

class PostRepository extends AbstractPostRepository {
  @override
  Future<List<Post>> getPosts(int page, int perPage) async {
    var apiKey = _getFlicrApiKey();

    var params = {
      'method': 'flickr.photos.search',
      'api_key': apiKey,
      'text': 'capybara japan',
      'page': page.toString(),
      'per_page': perPage.toString(),
    };

    var url = Uri.http("www.flickr.com", "/services/rest", params);
    var response = await http.get(url);

    List<Post> posts = [];

    var document = XmlDocument.parse(response.body);
    document.findAllElements("photo").forEach((element) {
      var id = int.parse(element.getAttribute('id')!);
      var server = element.getAttribute('server')!;
      var secret = element.getAttribute('secret')!;

      var imageUrl = 'https://live.staticflickr.com/$server/${id}_$secret.jpg';
      var post = Post(id: id, url: imageUrl, isLiked: false);
      posts.add(post);
    });

    return Future.value(posts);
  }

  String _getFlicrApiKey() {
    const flicrApiKey = String.fromEnvironment('FLICR_API_KEY');
    if (flicrApiKey.isEmpty) {
      throw AssertionError('FLICR_API_KEY is not set');
    }
    return flicrApiKey;
  }
}
