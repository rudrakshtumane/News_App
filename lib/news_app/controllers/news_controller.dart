import 'package:flutter_catalog/news_app/models/news_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class NewsController extends GetxController {
  var newsList = <News>[].obs; // Observable list
  var isLoading = false.obs; // Loading state
  var currentCategory = "Business".obs; // Selected category

  // Fetch news from API
  Future<void> fetchNews() async {
    try {
      isLoading(true); // Start loading
      final url =
          "https://newsapi.org/v2/top-headlines?category=${currentCategory.value}&apiKey=8e51cf0c8635440da08cd16c4c0b5f0f";


      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['articles'];
        newsList.value = data.map<News>((json) => News.fromJson(json)).toList();
      } else {
        Get.snackbar("Error", "Failed to fetch news");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false); // Stop loading
    }
  }

  // Change category and fetch news
  void changeCategory(String category) {
    currentCategory.value = category;
    fetchNews();
  }
}
