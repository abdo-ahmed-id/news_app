import 'package:news_app/data/providers/news.provider.dart';
import 'package:news_app/data/responses/articals.response.dart';

class SearchService {
  final DioProvider _dioProvider;

  SearchService(this._dioProvider);
  Future<ArticlesResponse> get(String value) async {
    var response = await _dioProvider.get(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'b790b8164c89424a8138bfa5ddef5596',
    });
    return ArticlesResponse.fromJson(response.data);
  }
}

//https://newsapi.org/v2/everything?q=us&apiKey=b790b8164c89424a8138bfa5ddef5596
