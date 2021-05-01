import 'package:dio/dio.dart';
import 'package:news_app/data/providers/news.provider.dart';

class SearchService {
  final NewsProvider _newsProvider;
  List<dynamic> search = [];

  SearchService(this._newsProvider);
  Future<Response> get(String value) async {
    return await _newsProvider.get('v2/everything', {
      'q': '$value',
      'apiKey': 'b790b8164c89424a8138bfa5ddef5596',
    }).then((value) {
      search = value.data['articles'];
    }).catchError((error) {
      print(error.toString());
    });
  }
}

//https://newsapi.org/v2/everything?q=us&apiKey=b790b8164c89424a8138bfa5ddef5596
