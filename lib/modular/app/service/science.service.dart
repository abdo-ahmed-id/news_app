import 'package:dio/dio.dart';
import 'package:news_app/data/providers/news.provider.dart';

class ScienceService {
  final NewsProvider _newsProvider;
  List<dynamic> science = [];

  ScienceService(this._newsProvider);
  Future<Response> get() async {
    return await _newsProvider.get('v2/top-headlines', {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'b790b8164c89424a8138bfa5ddef5596',
    }).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
