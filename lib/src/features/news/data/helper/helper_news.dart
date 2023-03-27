import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qombo/src/features/news/domain/models/article_model.dart';
import 'package:qombo/trial.dart';


class HelperNews {
  List<Article> news = [];

  Future<void> getNews() async {

    String url = "http://newsapi.org/v2/top-headlines?country=us&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=$newsKey";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if(element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element['content'],
            articleUrl: element['url'],
          );
          news.add(article);
        }
      });
    }
  }
}

class HelperNewsForCategory {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    String url = "";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if(element['urlToImage'] != null && element['description'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element['content'],
            articleUrl: element['url'],
          );
          news.add(article);
        }
      });
    }
  }
}