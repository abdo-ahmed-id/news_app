import 'package:news_app/data/models/article.model.dart';

class ArticlesResponse {
  String status;
  int totalResults;
  List<ArticleModel> articles;

  ArticlesResponse({this.status, this.totalResults, this.articles});

  ArticlesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticleModel>[];
      json['articles'].forEach((v) {
        articles.add(new ArticleModel.fromJson(v));
      });
    }
  }
}
