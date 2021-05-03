import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/responses/articals.response.dart';
import 'package:news_app/modular/app/bloc/app.state.dart';
import 'package:news_app/modular/app/service/mode.service.dart';
import 'package:news_app/modular/app/service/news.service.dart';
import 'package:news_app/modular/app/service/search.service.dart';

class AppBloc extends Cubit<AppState> {
  final ModeService _modeService;
  final NewsService _newsService;
  final SearchService _searchService;

  AppBloc(this._modeService, this._newsService, this._searchService)
      : super(AppState(
            isDark: _modeService.getBool(
                  'isMDark',
                ) ??
                false,
            business: [],
            sport: [],
            science: [],
            search: [],
            searchVal: ''));

  void initState() {
    // emit(state.copyWith(business: _businessService.business));
    businessGet();
    sportGet();
    scienceGet();
  }

  void onChanged(int index) {
    emit(state.copyWith(
      currentIndex: index,
    ));
  }

  void themeMode() async {
    await _modeService.putBool('isMDark', !state.isDark);
    emit(state.copyWith(isDark: _modeService.getBool('isMDark')));
  }

  void businessGet() async {
    ArticlesResponse res = await _newsService.get('business');
    if (res.status == 'ok') {
      emit(state.copyWith(business: res.articles));
    }
  }

  void sportGet() async {
    ArticlesResponse res = await _newsService.get('sport');
    if (res.status == 'ok') {
      emit(state.copyWith(sport: res.articles));
    }
  }

  void scienceGet() async {
    ArticlesResponse res = await _newsService.get('science');
    if (res.status == 'ok') {
      emit(state.copyWith(science: res.articles));
    }
  }

  search(String value) async {
    ArticlesResponse res = await _searchService.get(value);
    if (res.status == 'ok') {
      emit(state.copyWith(searchVal: value, search: res.articles));
    }
  }
}
