import 'package:equatable/equatable.dart';
import 'package:news_app/data/models/article.model.dart';

class AppState extends Equatable {
  final int currentIndex;
  final List<ArticleModel> business;
  final List<ArticleModel> sport;
  final List<ArticleModel> science;
  final List<ArticleModel> search;
  final bool isDark;
  final String searchVal;

  AppState(
      {this.currentIndex = 0,
      this.business,
      this.isDark = true,
      this.sport,
      this.science,
      this.searchVal,
      this.search});

  AppState copyWith(
          {int currentIndex,
          List<ArticleModel> business,
          bool isDark,
          List<ArticleModel> sport,
          List<ArticleModel> science,
          List<ArticleModel> search,
          String searchVal}) =>
      AppState(
        currentIndex: currentIndex ?? this.currentIndex,
        business: business ?? this.business,
        science: science ?? this.science,
        sport: sport ?? this.sport,
        isDark: isDark ?? this.isDark,
        searchVal: searchVal ?? this.searchVal,
        search: search ?? this.search,
      );

  @override
  List<Object> get props =>
      [currentIndex, business, sport, science, isDark, search, searchVal];
}
