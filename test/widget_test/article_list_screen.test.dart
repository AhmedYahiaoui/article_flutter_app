import 'package:article_flutter_app/screens/article_list.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ArticleListScreen loads articles', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ArticleListScreen(),
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    await tester.fling(
        find.byType(RefreshIndicator), const Offset(0, 100), 1000);
    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.fling(find.byType(ListView), const Offset(0, -300), 1000);
    await tester.pumpAndSettle();
  });
}
