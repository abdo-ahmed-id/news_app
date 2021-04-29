import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modular/app/bloc/app.state.dart';

class AppBloc extends Cubit<AppState> {
  AppBloc() : super(AppState());
  void onChanged(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
