class News {
  final String title;
  final String description;
  final String imageUrl;

  News({required this.title, required this.description, required this.imageUrl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      imageUrl: json['urlToImage'] ?? '',
    );
  }
}
