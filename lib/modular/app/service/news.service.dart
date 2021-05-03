import 'package:news_app/data/providers/news.provider.dart';
import 'package:news_app/data/responses/articals.response.dart';

class NewsService {
  final DioProvider _dioProvider;

  NewsService(this._dioProvider);

  Future<ArticlesResponse> get(String category) async {
    var response = await _dioProvider.get(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': category,
      'apiKey': 'b790b8164c89424a8138bfa5ddef5596',
    });
    return ArticlesResponse.fromJson(response.data);
  }
}
