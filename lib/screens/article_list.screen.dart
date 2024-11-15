import 'package:article_flutter_app/state/artical.provider.dart';
import 'package:article_flutter_app/widget/article_item.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key});

  @override
  _ArticleListScreenState createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ArticleProvider>(context, listen: false).fetchArticles();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !Provider.of<ArticleProvider>(context, listen: false).isLoading) {
      Provider.of<ArticleProvider>(context, listen: false).fetchArticles();
    }
  }

  @override
  Widget build(BuildContext context) {
    final articleProvider = Provider.of<ArticleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('News Articles'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await articleProvider.refreshArticles();
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: articleProvider.articles.length + 1,
          itemBuilder: (context, index) {
            if (index < articleProvider.articles.length) {
              return ArticleItem(articleProvider.articles[index]);
            } else if (articleProvider.isLoading) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (!articleProvider.hasMore) {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'No more articles to load!',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
