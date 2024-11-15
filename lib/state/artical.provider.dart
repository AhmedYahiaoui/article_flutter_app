import 'package:article_flutter_app/models/article.dart';
import 'package:article_flutter_app/services/article.service.dart';
import 'package:flutter/material.dart';

class ArticleProvider with ChangeNotifier {
  final ArticleService _articleService = ArticleService();
  List<Article> articles = [];
  bool isLoading = false;
  bool hasError = false;
  bool hasMore = true;
  int page = 1;

  Future<void> fetchArticles() async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      final List<Article> newArticles =
          await _articleService.fetchArticles(page);
      if (newArticles.isNotEmpty) {
        articles.addAll(newArticles);
        page++;
      } else {
        hasMore = false;
      }
    } catch (e) {
      hasError = true;
      hasMore = false;
    } finally {
      isLoading = false;
      hasMore = false;
      notifyListeners();
    }
  }

  Future<void> refreshArticles() async {
    isLoading = true;
    hasMore = true;
    articles.clear();
    page = 1;
    notifyListeners();

    await fetchArticles();
  }
}
