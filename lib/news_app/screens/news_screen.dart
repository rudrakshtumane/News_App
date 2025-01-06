import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/news_controller.dart';
import '../widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure the initial category is set when the screen is first loaded
    newsController.changeCategory(newsController.currentCategory.value);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCategoryButton("Business"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCategoryButton("Sports"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCategoryButton("Politics"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCategoryButton("Technology"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCategoryButton("Entertainment"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildCategoryButton("Science"),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() {
        // Show loading indicator while fetching news
        if (newsController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        // Show message if no news is available
        if (newsController.newsList.isEmpty) {
          return Center(child: Text("No News Available"));
        }
        // Use ListView.builder for vertical scrolling
        return PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: newsController.newsList.length,
          itemBuilder: (context, index) {
            return NewsCard(news: newsController.newsList[index]);
          },
        );
      }),
    );
  }

  // Helper function to build category buttons
  Widget _buildCategoryButton(String category) {
    return Obx(() {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: newsController.currentCategory.value == category.toLowerCase()
              ? const Color.fromARGB(255, 211, 211, 211)
              : Colors.white,
        ),
        onPressed: () {
          newsController.changeCategory(category.toLowerCase());
        },
        child: Text(category, style: const TextStyle(color: Colors.red, fontSize: 15 ),),
      );
    });
  }
}
