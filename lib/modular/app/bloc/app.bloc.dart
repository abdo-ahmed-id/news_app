import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modular/app/bloc/app.state.dart';
import 'package:news_app/modular/app/service/business.service.dart';
import 'package:news_app/modular/app/service/science.service.dart';
import 'package:news_app/modular/app/service/sport.service.dart';

class AppBloc extends Cubit<AppState> {
  final BusinessService _businessService;
  final SportService _sportService;
  final ScienceService _scienceService;
  AppBloc(
    this._businessService,
    this._scienceService,
    this._sportService,
  ) : super(AppState(isDark: false, business: _businessService.business));
  void initState() {
    businessGet();
    sportGet();
    scienceGet();
  }

  void onChanged(int index) {
    emit(state.copyWith(
      currentIndex: index,
    ));
  }

  void themeMode() {
    emit(state.copyWith(isDark: !state.isDark));
  }

  void businessGet() {
    _businessService.get();
    emit(state.copyWith(business: _businessService.business));
  }

  void sportGet() {
    _sportService.get();
  }

  void scienceGet() {
    _scienceService.get();
  }
}
