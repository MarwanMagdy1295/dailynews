import 'dart:convert';
import 'package:dailynews/models/article_model.dart';
import 'package:http/http.dart' as http;

class CategoryNews {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  List<ArticleModel> news = [];

  Future getData(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=f563ad2a84834da49f268adae7ed2663";
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var jsonData = jsonDecode(data);
      return jsonData;
    }
  }

  void getNews(String cat) async {
    var data = await getData(cat);
    if (data['status'] == 'ok') {
      data['articles'].forEach((element) {
        urlToImage = element['urlToImage'];
        author = element['author'];
        title = element['title'];
        description = element['description'];
        url = element['url'];
        publishedAt = element['publishedAt'];
        content = element['content'];
        // TODO: fetch data if true
        if (urlToImage != null && description != null) {
          ArticleModel articleModel = ArticleModel(
              author: author,
              title: title,
              description: description,
              url: url,
              urlToImage: urlToImage,
              publishedAt: publishedAt,
              content: content);
          // TODO: add articles to news list
          news.add(articleModel);
        }
      });
    }
  }
}
