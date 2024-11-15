import 'package:article_flutter_app/models/article.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Detail'),
      ),
      body: AnimatedArticleDetail(article: article),
    );
  }
}

class AnimatedArticleDetail extends StatelessWidget {
  final Article article;

  const AnimatedArticleDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildImageSection(),
          _buildTitleSection(),
          _buildCategorySection(),
          _buildPublishDateSection(),
          _buildSummarySection(),
        ],
      ),
    );
  }

  Widget _buildImageSection() {
    return FadeTransition(
      opacity: const AlwaysStoppedAnimation(100.0),
      child: CachedNetworkImage(
        imageUrl: article.imageUrl,
        width: double.infinity,
        height: 250,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitleSection() {
    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
        const AlwaysStoppedAnimation(1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          article.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return FadeTransition(
      opacity: const AlwaysStoppedAnimation(1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          article.category ?? 'No Category',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  Widget _buildPublishDateSection() {
    String formattedDate =
        DateFormat('MMM dd, yyyy').format(article.publishDate);

    return FadeTransition(
      opacity: const AlwaysStoppedAnimation(1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Published on: $formattedDate',
          style: const TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildSummarySection() {
    return FadeTransition(
      opacity: const AlwaysStoppedAnimation(1.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          article.summary,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
