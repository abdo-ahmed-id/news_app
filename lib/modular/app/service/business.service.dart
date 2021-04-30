import 'package:dio/dio.dart';
import 'package:news_app/data/providers/news.provider.dart';

class BusinessService {
  final NewsProvider _newsProvider;
  List<dynamic> business = [];

  BusinessService(this._newsProvider);
  Future<Response> get() async {
    return await _newsProvider.get('v2/top-headlines', {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'b790b8164c89424a8138bfa5ddef5596',
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      // print(value.data.toString());
    }).catchError((error) {
      print(error.toString());
    });
  }
}
