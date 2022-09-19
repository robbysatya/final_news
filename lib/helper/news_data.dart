import 'dart:convert';

import 'package:projectfinal_bootcamp/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsData {
  List<ArticleModel> newsData = [];

  Future<void> getNewsData() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=58b7bccdad0b412db3128607b9b99144";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
          );

          newsData.add(articleModel);
        
        }
      });
    }
  }
}
