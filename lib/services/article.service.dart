import 'package:article_flutter_app/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ArticleService {
  final String baseUrl =
      "https://raw.githubusercontent.com/Keyclic/coding-game-samples/refs/heads/main/feed/articles/";

  Future<List<Article>> fetchArticles(int page) async {
    final String finalBaseUrl = "$baseUrl/$page.json";

    final response = await http.get(Uri.parse(finalBaseUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> items = data['items'];
      return items.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load articles");
    }
  }
}
