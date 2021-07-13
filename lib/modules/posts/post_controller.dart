import 'dart:convert';
import 'package:api_posts/modules/posts/post_model.dart';
import 'package:http/http.dart' as http;

class PostsController {
  Future<List<Post>> getPosts() async {
    List<Post> posts = [];

    final baseURL = "http://jsonplaceholder.typicode.com";
    var url = Uri.parse(
      '$baseURL/posts',
    );
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      posts = json.map((e) => Post.fromJson(e)).toList();
    }
    return posts;
  }
}
