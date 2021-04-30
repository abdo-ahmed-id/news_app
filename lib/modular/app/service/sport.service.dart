import 'package:dio/dio.dart';
import 'package:news_app/data/providers/news.provider.dart';

class SportService {
  final NewsProvider _newsProvider;
  List<dynamic> sport = [];

  SportService(this._newsProvider);
  Future<Response> get() async {
    return await _newsProvider.get('v2/top-headlines', {
      'country': 'eg',
      'category': 'sport',
      'apiKey': 'b790b8164c89424a8138bfa5ddef5596',
    }).then((value) {
      sport = value.data['articles'];
      print(sport[0]['title']);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
