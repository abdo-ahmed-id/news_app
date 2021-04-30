import 'package:builders/builders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:news_app/helper/app_routes.dart';
import 'package:news_app/helper/theme.dart';
import 'package:news_app/modular/app/bloc/app.bloc.dart';
import 'package:news_app/modular/app/bloc/app.state.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
        cubit: Modular.get<AppBloc>(),
        builder: (_, state) {
          return MaterialApp(
            themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            initialRoute: AppRoutes.home,
          ).modular();
        });
  }
}
