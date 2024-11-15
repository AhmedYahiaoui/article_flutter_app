import 'package:article_flutter_app/models/article.dart';
import 'package:article_flutter_app/screens/article.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets('ArticleScreen displays article details',
      (WidgetTester tester) async {
    final article = Article(
      id: '001',
      title: 'Test Article',
      summary: 'This is a summary of the test article.',
      imageUrl: 'https://placehold.co/234x187/jpg',
      isPremium: false,
      publishDate: DateTime.now(),
      category: 'Test Category',
    );

    await tester.pumpWidget(MaterialApp(
      home: ArticleScreen(article: article),
    ));

    expect(find.text('Test Article'), findsOneWidget);

    expect(find.text('This is a summary of the test article.'), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);

    expect(find.text('Test Category'), findsOneWidget);

    final formattedDate =
        DateFormat('MMM dd, yyyy').format(article.publishDate);
    expect(find.text('Published on: $formattedDate'), findsOneWidget);
  });
}
