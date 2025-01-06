import 'package:flutter/material.dart';
import 'package:flutter_catalog/news_app/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({required this.news});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.imageUrl.isNotEmpty)
              Expanded(
                flex: 1,
                child: Image.network(news.imageUrl, fit: BoxFit.cover)),
            
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  news.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(news.description),
              ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
