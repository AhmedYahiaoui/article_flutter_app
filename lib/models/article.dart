class Article {
  final String id;
  final String title;
  final String summary;
  final String imageUrl;
  final DateTime publishDate;
  final bool isPremium;
  final String? category;

  Article({
    required this.id,
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.publishDate,
    required this.isPremium,
    this.category,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      imageUrl: json['imageUrl'],
      publishDate: DateTime.parse(json['publishDate']),
      isPremium: json['isPremium'],
      category: json['category'],
    );
  }
}
