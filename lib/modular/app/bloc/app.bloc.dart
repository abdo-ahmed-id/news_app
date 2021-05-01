import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modular/app/bloc/app.state.dart';
import 'package:news_app/modular/app/service/business.service.dart';
import 'package:news_app/modular/app/service/mode.service.dart';
import 'package:news_app/modular/app/service/science.service.dart';
import 'package:news_app/modular/app/service/sport.service.dart';

class AppBloc extends Cubit<AppState> {
  final BusinessService _businessService;
  final SportService _sportService;
  final ScienceService _scienceService;
  final ModeService _modeService;

  AppBloc(
    this._modeService,
    this._businessService,
    this._scienceService,
    this._sportService,
  ) : super(AppState(
            isDark: _modeService.getBool('isMDark') ?? false,
            business: _businessService.business));
  void initState() {
    emit(state.copyWith(business: _businessService.business));
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
    _modeService.putBool('isMDark', !state.isDark);
    emit(state.copyWith(isDark: state.isDark));
    emit(state.copyWith(isDark: _modeService.getBool('isMDark')));
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
