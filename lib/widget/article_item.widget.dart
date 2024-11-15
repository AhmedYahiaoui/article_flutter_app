import 'package:article_flutter_app/models/article.dart';
import 'package:article_flutter_app/screens/article.screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  final Article article;

  const ArticleItem(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(article.imageUrl),
        ),
        title: Text(article.title),
        subtitle: Text(article.summary),
        trailing: article.isPremium
            ? const Icon(Icons.star, color: Colors.orange)
            : null,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleScreen(article: article),
            ),
          );
        },
      ),
    );
  }
}
