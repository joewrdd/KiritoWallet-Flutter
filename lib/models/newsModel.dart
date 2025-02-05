class NewsModel {
  final String title;
  final String description;
  final String link;
  final String imageUrl;
  final String pubDate;
  final String source;

  NewsModel({
    required this.title,
    required this.description,
    required this.link,
    required this.imageUrl,
    required this.pubDate,
    required this.source,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      link: json['link'] ?? '',
      imageUrl: json['image_url'] ?? 'https://via.placeholder.com/150',
      pubDate: json['pubDate'] ?? '',
      source: json['source_id'] ?? '',
    );
  }
}
