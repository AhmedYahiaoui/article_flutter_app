import 'package:article_flutter_app/services/article.service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Fetch articles returns a list of articles", () async {
    final service = ArticleService();
    final articles = await service.fetchArticles(1);
    expect(articles.isNotEmpty, true);
  });
}
